/**
* @File Name : YoutubeIntegration.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : August 30, 2024
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | August 30, 2024 |   | Initial Version
**/

public class YoutubeIntegration {
	@AuraEnabled
	Public static void LightningStudio(){
		System.debug('Lightning Studio');
	}

	public static void youtubeServiceCallout(){

		Http http = new Http();
		Httprequest req = new Httprequest();
		req.setMethod('GET');
		req.setEndpoint('https://www.googleapis.com/youtube/v3/activities');
		req.setHeader('part','id');
		req.setHeader('channelId','UChTdRj6YfwqhR_WEFepkcJw');
		req.setHeader('access_token','AIzaSyC9wkg_yZ-5yYSfURBQdsAA7qAszbP5Kek');


		httpResponse res = http.send(req);

		if(res.getStatusCode() == 200){
			System.debug('Reponse from Youtube API ' + res.getBody());
		}


	}
}