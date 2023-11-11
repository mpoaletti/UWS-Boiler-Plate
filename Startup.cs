﻿using IdentityModel.Client;
using Microsoft.AspNet.Identity;
using Microsoft.IdentityModel.Protocols.OpenIdConnect;
using Microsoft.IdentityModel.Tokens;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OpenIdConnect;
using Owin;
using System;
using System.Collections.Generic;
using System.Configuration;
//using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
//using System.Web;

[assembly: OwinStartup(typeof(UWS_Boiler_Plate.Startup))]

namespace UWS_Boiler_Plate
{
    public class Startup
    {
        private readonly string _clientId = ConfigurationManager.AppSettings["okta:ClientId"];
        private readonly string _redirectUri = ConfigurationManager.AppSettings["okta:RedirectUri"];
        private readonly string _authority = ConfigurationManager.AppSettings["okta:OrgUri"];
        private readonly string _clientSecret = ConfigurationManager.AppSettings["okta:ClientSecret"];
        private readonly string _postLogoutRedirectUri = ConfigurationManager.AppSettings["okta:PostLogoutRedirectUri"];

        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }

        public void ConfigureAuth(IAppBuilder app)
        {
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            app.SetDefaultSignInAsAuthenticationType(CookieAuthenticationDefaults.AuthenticationType);
            app.UseCookieAuthentication(new CookieAuthenticationOptions());

            app.UseOpenIdConnectAuthentication(new OpenIdConnectAuthenticationOptions
            {
                ClientId = _clientId,
                ClientSecret = _clientSecret,
                Authority = _authority,
                RedirectUri = _redirectUri,
                PostLogoutRedirectUri = _postLogoutRedirectUri,
                ResponseType = OpenIdConnectResponseType.IdToken,
                Scope = OpenIdConnectScope.OpenIdProfile,
                TokenValidationParameters = new TokenValidationParameters { NameClaimType = "name" },
                Notifications = new OpenIdConnectAuthenticationNotifications
                {
                    AuthorizationCodeReceived = async n =>
                    {
                        var tokenClient = new TokenClient($"{_authority}/v1/token", _clientId, _clientSecret);
                        var tokenResponse = await tokenClient.RequestAuthorizationCodeAsync(n.Code, _redirectUri);

                        if (tokenResponse.IsError)
                        {
                            throw new Exception(tokenResponse.Error);
                        }

                        var userInfoClient = new UserInfoClient($"{_authority}/v1/userinfo");
                        var userInfoResponse = await userInfoClient.GetAsync(tokenResponse.AccessToken);

                        var claims = new List<Claim>(userInfoResponse.Claims)
                        {
                        new Claim("id_token", tokenResponse.IdentityToken),
                        new Claim("access_token", tokenResponse.AccessToken),
                        };

                        n.AuthenticationTicket.Identity.AddClaims(claims);
                    },

                    RedirectToIdentityProvider = n =>
                    {
                        // If signing out, add the id_token_hint
                        if (n.ProtocolMessage.RequestType == OpenIdConnectRequestType.Logout)
                        {
                            var idTokenClaim = n.OwinContext.Authentication.User.FindFirst("id_token");

                            if (idTokenClaim != null)
                            {
                                n.ProtocolMessage.IdTokenHint = idTokenClaim.Value;
                            }
                        }

                        return Task.CompletedTask;
                    },
                },
            });
        }

    }
}
