package com.babyboy.google_login;

import java.io.IOException;
import java.security.GeneralSecurityException;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

public class IdTokenVerifierAndParser {

	 private static final String GOOGLE_CLIENT_ID = "846452851200-egpu2opeonr5u0umhb41h6amgud09qog.apps.googleusercontent.com";
	 
	 public static GoogleIdToken.Payload getPayLoad (String tokenString) throws GeneralSecurityException, IOException {
		 
		 JacksonFactory jacksonFactory = new JacksonFactory();
		 GoogleIdTokenVerifier googleIdTokenVerifier = 
				 new GoogleIdTokenVerifier(new NetHttpTransport(), jacksonFactory);
		 
		 GoogleIdToken token = GoogleIdToken.parse(jacksonFactory, tokenString);
		 
		 if(googleIdTokenVerifier.verify(token)) {
			 GoogleIdToken.Payload payload = token.getPayload();
			 if(!GOOGLE_CLIENT_ID.equals(payload.getAudience())) {
				 throw new IllegalArgumentException("Audience mismatch");
			 } else if (!GOOGLE_CLIENT_ID.equals(payload.getAuthorizedParty())) {
				 throw new IllegalArgumentException("Client ID mismatch");
			 }
			 
			 return payload;
		 } else {
			 throw new IllegalArgumentException("id token cannot be verified");
		 }
	 }
}
