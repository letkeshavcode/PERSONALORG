public with sharing class GoogleWebService {
    public class relatedFile {
        public String PathOnClient;
        public String Title;
        public Blob VersionData;
    }
    public static Http http = new Http();
    public static HTTPResponse response;
    public static HttpRequest request;
 
    // public static void getProfile(String userEmail) {
 
    //     request = new HttpRequest();
    //     request.setMethod('GET');
    //     request.setEndpoint('callout:DriveConnect/gmail/v1/users/' + userEmail + '/profile');
 
    //     response = http.send(request); 
 
    //     System.debug(response.getBody());
    // }
 
    // public static void getUserDrafts(String userEmail) {
 
    //     request = new HttpRequest();
    //     request.setMethod('GET');
    //     request.setEndpoint('callout:DriveConnect/gmail/v1/users/' + userEmail + '/drafts');
 
    //     response = http.send(request); 
 
    //     System.debug(response.getBody());
    // }
 
    // public static void getMyCalendar() {
         
    //     request = new HttpRequest();
    //     request.setMethod('GET');
    //     request.setEndpoint('callout:DriveConnect/calendar/v3/users/me/calendarList');
 
    //     response = http.send(request); 
 
    //     System.debug(response.getBody());
    // }
        
    @AuraEnabled(cacheable=true)
    public static String createNewFile(String name,String type){
        try {
           
            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:DriveConnect/drive/v3/files/');
            request.setMethod('POST');
          request.setHeader('Content-Type', 'application/json;charset=UTF-8');
            // Set the body as a JSON object
            if(type == 'pdf'){
               request.setBody('{"mimeType": "application/vnd.google-apps.folder" ,"name": "'+name + '" }');
           // request.setBodyAsBlob(Blob.valueOf(body));
  
            }else if(type=='image'){
                request.setBody('{"mimeType": "image/jpeg" ,"name": "'+name + '" }');
            }
            else{
                request.setBody('{"mimeType": "application/vnd.google-apps.document" ,"name": "'+name + '","data":"hello world" }');
            }
            
            HttpResponse response = http.send(request);
            // Parse the JSON response
            if (response.getStatusCode() != 200) {
                
                System.debug('The status code returned was not expected: ' +
                response.getStatusCode() + ' ' + response.getStatus());
            } else {
                System.debug(response.getBody());
            }
            System.debug('result' + response.getBody());
            return response.getBody();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
       
        
    }
    // @AuraEnabled
    // public static String uploadFile(String filetype,String filename, String base64,String recordId){
    //     try {   
    //         //String filetype='image/jpeg';
    //     String bodyEncoded = base64;
    //     String boundary = '----------9889464542212';
    //     String delimiter = '\r\n--' + boundary + '\r\n';
    //     String close_delim = '\r\n--' + boundary + '--';
    //   //  String bodyEncoded = EncodingUtil.base64Encode(file);
    //     String body = delimiter + 'Content-Type: application/json\r\n\r\n' + '{ "title" : "' + filename + '",' + ' "mimeType" : "' + filetype + '" }' + delimiter + 'Content-Type: ' + filetype + '\r\n' + 'Content-Transfer-Encoding:base64\r\n' + '\r\n' + bodyEncoded + close_delim;
    //     Http http = new Http();
    //     HttpRequest req = new HttpRequest();
    //     req.setEndpoint('callout:DriveConnect/upload/drive/v2/files?uploadType=multipart');
    //     //req.setHeader('Authorization', 'Bearer ' + accessToken);
    //     req.setHeader('Content-Type', 'multipart/mixed; boundary="' + boundary + '"');
    //     req.setHeader('Content-length', String.valueOf(body.length()));
    //     system.debug('body.length()'+body.length());
    //     system.debug('body>>'+body);
    //     req.setBody(body);
    //     req.setMethod('POST');
    //     req.setTimeout(60 * 1000);
    //     HttpResponse resp = http.send(req);
    //     system.debug('resp'+resp);
    //         return resp.getBody();
    //         // String boundary = '----------9889464542212';
    //         // System.debug('filename----'+ filename);
    //         // System.debug('base64----'+base64);
    //         // Http http = new Http();
    //         // HttpRequest request = new HttpRequest();
    //         // request.setEndpoint('callout:DriveConnect/upload/drive/v2/files?uploadType=multipart');
    //         // request.setMethod('POST');
    //         // request.setHeader('Content-Type', 'multipart/mixed; boundary="' + boundary + '"');
    //         // // if(type == 'pdf'){
    //         // //     request.setBody('{"mimeType": "application/vnd.google-apps.document" ,"name": "'+filename + '","Content-Transfer-Encoding": "'+ base64 + '" } ');
    //         // // }else if(type=='image'){
    //         // //     request.setBody('{"mimeType": "image/jpeg","name": "'+ filename + '" ,"Content-Transfer-Encoding": "'+ base64 + '"}');
    //         // // }
    //         // // else{
    //         //     request.setBody('{"mimeType": "application/vnd.google-apps.document" ,"name": "'+filename + '","Content-Transfer-Encoding": "'+ base64 + '" } ');
    //         // //}

    //         // HttpResponse response = http.send(request);
    //         // return response.getBody();

    //     } catch (Exception e) {
    //         throw new AuraHandledException(e.getMessage());
    //     }
    // }
@AuraEnabled
    public static void uploadFile(Id recordId) {
        ContentVersion cv = [SELECT Id, Title, VersionData FROM ContentVersion WHERE Id =: recordId];
        System.debug(cv);
		String jsonData = '{"name": "File 66"}';
  	   // String body = '--foo_bar_baz\r\nContent-Type: application/json; charset=UTF-8\r\n\r\n' + jsonData + '\r\n\r\n--foo_bar_baz\r\nContent-Transfer-Encoding: base64\r\nContent-Type: application/json\r\n\r\n' +EncodingUtil.base64Encode(cv.VersionData) + '\r\n--foo_bar_baz--';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:DriveConnect/upload/drive/v3/files?uploadType=multipart');
        request.setHeader('Content-Type', 'multipart/related; boundary=foo_bar_baz');
       // request.setHeader('Content-Length', Blob.valueOf(body).size() + '');
        request.setMethod('POST');
		 request.setBody('{"mimeType": "application/vnd.google-apps.folder" ,"name": "'+'test name' + '" }');

         //request.setBody(body);
        HttpResponse response = new HttpResponse();
        response = http.send(request);
        system.debug('>>>>response body'+response.getBody());
    }
    
    @AuraEnabled
   public static void uploadFile2(String fileName, Blob fileData) {

        HttpRequest req = new HttpRequest();

        req.setEndpoint('callout:DriveConnect/drive/v3/files/'); // Replace with your desired endpoint URL

        req.setMethod('POST');
        String boundary = '----------------------------' + String.valueOf(System.currentTimeMillis());
        String header = '--' + boundary + '\r\nContent-Disposition: form-data; name="file"; filename="' + fileName + '"\r\nContent-Type: application/octet-stream\r\n\r\n';
        String footer = '\r\n--' + boundary + '--\r\n';
        String body = header + EncodingUtil.base64Encode(fileData) + footer;
           req.setHeader('Content-Type', 'multipart/form-data; boundary=' + boundary);
       req.setHeader('Content-Length', String.valueOf(body.length()));
        req.setBody(body);
        Http http = new Http();
        HttpResponse res = http.send(req);
        if (res.getStatusCode() == 200) {
            // File uploaded successfully
        } else {
            // Handle error response
        }
    }

@AuraEnabled
public static String uploading(List<Map<String, Object>> files){
    try {
        
        System.debug(files);
        //blob base64 = files[0].get('VersionData');
        System.debug('list of files--'+ files);
        //blob bodyEncoded = base64;
     //   String filename = files[0].get('Title');
        String name = files[0].get('Title')+'';
        System.debug(name);
        //String ext = name.split('.').get(1)+'';
             
       
        //System.debug(ext);
        
        String filetype ='image/jpeg';
        String boundary = '----------9889464542212';
        String delimiter = '\r\n--' + boundary + '\r\n';
        String close_delim = '\r\n--' + boundary + '--';
      //  String bodyEncoded = EncodingUtil.base64Encode(file);
        String body = delimiter + 'Content-Type: application/json\r\n\r\n' + '{ "title" : "' + files[0].get('Title') + '",' + ' "mimeType" : "' + filetype + '" }' + delimiter + 'Content-Type: ' + filetype + '\r\n' + 'Content-Transfer-Encoding:base64\r\n' + '\r\n' + files[0].get('VersionData') + close_delim;
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:DriveConnect/upload/drive/v2/files?uploadType=multipart');
        //req.setHeader('Authorization', 'Bearer ' + accessToken);
        req.setHeader('Content-Type', 'multipart/mixed; boundary="' + boundary + '"');
        req.setHeader('Content-length', String.valueOf(body.length()));
        system.debug('body.length()'+body.length());
        system.debug('body>>'+body);
        req.setBody(body);
        req.setMethod('POST');
        req.setTimeout(60 * 1000);
        HttpResponse resp = http.send(req);
        system.debug('resp'+resp);
        return resp.getBody();


    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
}

    @AuraEnabled(cacheable=true)
    public static String getFile(String fileId) {
 		String result='';
        request = new HttpRequest();
        request.setMethod('GET');
       // request.setEndpoint('callout:DriveConnect/drive/v3/files/' + fileId);
         request.setEndpoint('callout:DriveConnect/drive/v3/files/');
        response = http.send(request); 
 		result += response.getBody();
        
        System.debug(response.getBody());
        // convertorjtoa converted = convertorjtoa.parse(result);
        // System.debug('debuggin----'+ converted);
        return result;
    }
}