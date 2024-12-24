public with sharing class GoogleSheetIntegration {
     
    @AuraEnabled
    public static Map<String, Object> googleSheetsConnect(){
        try {
            System.debug('in the method');
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:gs_connect/v4/spreadsheets/1z-gYuErj3Icjs2dSAU6HnZxnv6h4Xwe6lUs3lhROjs8/values/Sheet1');
            request.setMethod('GET');
            HttpResponse response = http.send(request);
            // If the request is successful, parse the JSON response.
            System.debug('status code'+ response.getStatusCode());
            Map<String, Object> results = new Map<String,Object>();
            if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            // String results = response.getBody();
            results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('result of data ' + results);
            }
            return results;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static  Map<String, Object>  linkedinIntegration(){
        try {
            HttpRequest req = new HttpRequest();
            Http http = new Http();
            HTTPResponse response = new HTTPResponse();

            req.setMethod('GET');
            req.setEndpoint('https://api.linkedin.com/v2/me');
            //here callout: is fixed, then after namecredintailname, then after add slash and appropitate url, in which url you want to hit
            String token = 'AQVVRgJfkbNj1lZ2OPACxEVV8730kJaRu6w2tEzN71cZt-x0FIZXLxugQnyK2ZNxUSVIOaAoMxXCloqeMVhVW73lwfZsg0fc9z3U5kTI5e6CYwaXEpKWm2SKZvpZrFEnomYq9OqxnAF4mpo6se7RTkvRoBIDKSyfqX2Yp6psNpgc0V75mMTF3dN_fZzlsJZcn9rpHNMZnfJ15P0gU7VeDjgzTABCtgIXEN96TuGzlNhVcXnGhtqQO4Sfi4qhRsxX0eYepgqStQgX5hbkk6N-cOi-cJiXHh2pr110okNbNjsf3Fs7LHDgZZl8xAEUz4RmE4laa0Mo82Ny1VXN19zz5ztwqte4Fg';
            req.setHeader( 'Authorization', 'Bearer ' + token );
            response = http.send(req);
            Map<String, Object> results = new Map<String,Object>();
            System.debug('response------>' + response);
            System.debug('response-' + response.getBody());
            if(response.getStatusCode() == 200) {
                // Deserialize the JSON string into collections of primitive data types.
                // String results = response.getBody();
                results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                System.debug('result of data ' + results);
                System.debug('id--->'+ results.get('id'));
                // String accessToken = Auth.AuthToken.getAccessToken('0SO5j000000g76h', 'linkedin');
                // Map<String, String> responseMap = Auth.AuthToken.refreshAccessToken('0SO5j000000g76h', 'linkedin', accessToken);
                // System.debug('auth token' + accessToken);
                // System.debug('refreshed token' + responseMap);
            }


            return results;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static void postLinkedin(String userId,String text){
        try {
            // String accessToken = Auth.AuthToken.getAccessToken('0SO5j000000g76h', 'LinkedIn');
            // Map<String, String> responseMap = Auth.AuthToken.refreshAccessToken('0SO5j000000g76h', 'LinkedIn', accessToken);
            // System.debug('auth token' + accessToken);
            // System.debug('refreshed token' + responseMap);
            String u = userId.remove('"');
            System.debug('user id'+userId);
            Http http = new Http();
            // Instantiate a new HTTP request, specify the method (POST) as well as the endpoint
           HttpRequest req = new HttpRequest(); 
           String body ='{"author": "urn:li:person:'+u+'","lifecycleState": "PUBLISHED", "specificContent": {"com.linkedin.ugc.ShareContent": {"shareCommentary": {"text":"'+ text +'"},"shareMediaCategory": "NONE"}},"visibility": {"com.linkedin.ugc.MemberNetworkVisibility": "PUBLIC" }}';
            String token = 'AQVVRgJfkbNj1lZ2OPACxEVV8730kJaRu6w2tEzN71cZt-x0FIZXLxugQnyK2ZNxUSVIOaAoMxXCloqeMVhVW73lwfZsg0fc9z3U5kTI5e6CYwaXEpKWm2SKZvpZrFEnomYq9OqxnAF4mpo6se7RTkvRoBIDKSyfqX2Yp6psNpgc0V75mMTF3dN_fZzlsJZcn9rpHNMZnfJ15P0gU7VeDjgzTABCtgIXEN96TuGzlNhVcXnGhtqQO4Sfi4qhRsxX0eYepgqStQgX5hbkk6N-cOi-cJiXHh2pr110okNbNjsf3Fs7LHDgZZl8xAEUz4RmE4laa0Mo82Ny1VXN19zz5ztwqte4Fg';
            System.debug('body'+body);
           req.setEndpoint('https://api.linkedin.com/v2/ugcPosts');
           req.setMethod('POST');
           //Content-Type  header is set to let the service know that the sent data is in JSON format
           req.setHeader('Content-Type', 'application/json');
          req.setHeader( 'Authorization', 'Bearer ' + token );
           //Specify the body to be send (contains JSON data)
            req.setBody(body); 
            HttpResponse response = http.send(req);
            System.debug('<<<<response>>>>'+ response.getStatusCode() +'----'+ response.getBody());
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
//@AuraEnabled
    // public static void doGetAccessToken(){
    //     String authCodeFromURL = ApexPages.currentPage().getParameters().get('code');
    //     Http http = new Http();
    //     HttpRequest httpReq = new HttpRequest();
    //     HttpResponse httpRes = new HttpResponse();
        
    //     String requestTokenBody = 'code=&grant_type=authorization_code'+
    //                                 '&client_id='+'77n1ixkrrgbixk'+'&client_secret='+'2IhWSdlt2Epp3Cvc'+
    //                                 '&redirect_uri='+'https://appcinotechnologies19-dev-ed.my.salesforce.com/services/authcallback/linkedin';
    //     String errorMessage = '';
        
    //     System.debug('#### authCodeFromURL '+authCodeFromURL);
    //     System.debug('#### requestTokenBody '+requestTokenBody);
        
    //     httpReq.setMethod('POST');
    //     httpReq.setEndpoint('callout:linkedInNamedCredential/oauth/v2/accessToken');
    //     httpReq.setHeader('Content-Type', 'application/x-www-form-urlencoded');
    //     httpReq.setBody(requestTokenBody);
        
    //     try{
    //         httpRes = http.send(httpReq);
    //         if(httpRes.getStatusCode() == 200){
             
    //             Map<String,object> TokenInfo = (Map<String,object>)JSON.deserializeUntyped(httpRes.getBody());
                
    //           System.debug('tokeninfo'+ TokenInfo);
                
    //         }else{
    //             errorMessage = 'Unexpected Error while communicating with LinkedIn API. '
    //                                 +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
    //             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
    //         }
    //     }catch(System.Exception e){
    //         System.debug('#### Exception Excuted '+e.getStackTraceString()+'  '+e.getMessage());
    //         if(String.valueOf(e.getMessage()).startsWith('Unauthorized endpoint')){
    //             errorMessage =  'Unauthorize endpoint: An Administer must go to Setup -> Administer -> Security Control ->'
    //                                 +' Remote Site Setting and add '+' Endpoint';
    //             ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
    //         }else{
    //             errorMessage = 'Unexpected Error while communicating with LinkedIn API. '
    //                                 +'Status '+httpRes.getStatus()+' and Status Code '+httpRes.getStatuscode();
    //             ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR, errorMessage));
    //         }
    //     }
    // }


}