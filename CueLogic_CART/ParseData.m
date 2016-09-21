//
//  ParseData.m
//  CueLogic_CART
//
//  Created by Mahesh Mavurapu on 20/09/16.
//  Copyright © 2016 Mahesh Mavurapu. All rights reserved.
//

#import "ParseData.h"

@implementation ParseData

+(void)parseJsonResponse:(NSDictionary*)json
{
    Products *products = [[Products alloc]init];
    products = [products initWithProducts:json];
    
    DBParseSave *parseSave = [[DBParseSave alloc]init];
    [parseSave parseJsonObject:products];
    
//    Query *query = [[Query alloc]init];
//    
//    query.count = [queryDic valueForKey:@"count"];
//    query.created = [queryDic valueForKey:@"created"];
//    query.lang = [queryDic valueForKey:@"lang"];
//    NSDictionary *resultsDic = [queryDic objectForKey:@"results"];
//    
//    Results *results = [[Results alloc]init];
//    
//    NSDictionary *channelDic = [resultsDic objectForKey:@"channel"];
//    
//    Channel *channel = [[Channel alloc]init];
//    
//    NSDictionary *unitsDic = [channelDic objectForKey:@"units"];
//    
//    Units *units = [[Units alloc]init];
//    
//    units.distance = [unitsDic valueForKey:@"distance"];
//    units.speed = [unitsDic valueForKey:@"speed"];
//    units.pressure = [unitsDic valueForKey:@"pressure"];
//    units.temperature = [unitsDic valueForKey:@"temperature"];
//    channel.title = [channelDic valueForKey:@"title"];
//    channel.link = [channelDic valueForKey:@"link"];
//    channel.Description = [channelDic valueForKey:@"description"];
//    channel.language = [channelDic valueForKey:@"language"];
//    channel.lastBuildDate = [channelDic valueForKey:@"lastBuildDate"];
//    channel.ttl = [channelDic valueForKey:@"ttl"];
//    NSDictionary *locationDic = [channelDic objectForKey:@"location"];
//    
//    Location *location = [[Location alloc]init];
//    
//    location.city = [locationDic valueForKey:@"city"];
//    location.country = [locationDic valueForKey:@"country"];
//    location.region = [locationDic valueForKey:@"region"];
//    NSDictionary *windDic = [channelDic objectForKey:@"wind"];
//    
//    Wind *wind = [[Wind alloc]init];
//    
//    wind.chill = [windDic valueForKey:@"chill"];
//    wind.direction = [windDic valueForKey:@"direction"];
//    wind.speed = [windDic valueForKey:@"speed"];
//    NSDictionary *atmosphereDic = [channelDic objectForKey:@"atmosphere"];
//    
//    Atmosphere *atmosphere = [[Atmosphere alloc]init];
//    
//    atmosphere.humidity = [atmosphereDic valueForKey:@"humidity"];
//    atmosphere.pressure = [atmosphereDic valueForKey:@"pressure"];
//    atmosphere.rising = [atmosphereDic valueForKey:@"rising"];
//    atmosphere.visibility = [atmosphereDic valueForKey:@"visibility"];
//    NSDictionary *astronomyDic = [channelDic objectForKey:@"astronomy"];
//    
//    Astronomy *astronomy = [[Astronomy alloc]init];
//    
//    astronomy.sunrise = [astronomyDic valueForKey:@"sunrise"];
//    astronomy.sunset = [astronomyDic valueForKey:@"sunset"];
//    NSDictionary *imageDic = [channelDic objectForKey:@"image"];
//    
//    Image *image = [[Image alloc]init];
//    
//    image.title = [imageDic valueForKey:@"title"];
//    image.width = [imageDic valueForKey:@"width"];
//    image.height = [imageDic valueForKey:@"height"];
//    image.link = [imageDic valueForKey:@"link"];
//    image.url = [imageDic valueForKey:@"url"];
//    NSDictionary *itemDic = [channelDic objectForKey:@"item"];
//    
//    Item *item = [[Item alloc]init];
//    
//    item.title = [itemDic valueForKey:@"title"];
//    item.lat = [itemDic valueForKey:@"lat"];
//    item.Long = [itemDic valueForKey:@"long"];
//    item.link = [itemDic valueForKey:@"link"];
//    item.pubDate = [itemDic valueForKey:@"pubDate"];
//    NSDictionary *conditionDic = [itemDic objectForKey:@"condition"];
//    
//    Condition *condition = [[Condition alloc]init];
//    
//    condition.code = [conditionDic valueForKey:@"code"];
//    condition.date = [conditionDic valueForKey:@"date"];
//    condition.temp = [conditionDic valueForKey:@"temp"];
//    condition.text = [conditionDic valueForKey:@"text"];
//    NSArray *forecastArr = [itemDic objectForKey:@"forecast"];
//    NSMutableArray *foreCastArr = [[NSMutableArray alloc]init];
//    for(int i=0; i< forecastArr.count; i++)
//    {
//        NSDictionary *forecastDic = forecastArr[i];
//        
//        Forecast *forecast = [[Forecast alloc]init];
//        
//        forecast.code = [forecastDic valueForKey:@"code"];
//        forecast.date = [forecastDic valueForKey:@"date"];
//        forecast.day = [forecastDic valueForKey:@"day"];
//        forecast.high = [forecastDic valueForKey:@"high"];
//        forecast.low = [forecastDic valueForKey:@"low"];
//        forecast.text = [forecastDic valueForKey:@"text"];
//        
//        [foreCastArr addObject:forecast];
//    }
//    item.Description = [itemDic valueForKey:@"description"];
//    NSDictionary *guidDic = [itemDic objectForKey:@"guid"];
//    
//    Guid *guid = [[Guid alloc]init];
//    
//    guid.isPermaLink = [[guidDic valueForKey:@"isPermaLink"] boolValue];
//    
//    // Parsing Done
//    
//    item.condition = condition;
//    item.forecasts = foreCastArr;
//    item.guid = guid;
//    
//    channel.item = item;
//    channel.image = image;
//    channel.astronomy = astronomy;
//    channel.atmosphere = atmosphere;
//    channel.wind = wind;
//    channel.location = location;
//    channel.units = units;
//    
//    results.channel = channel;
//    
//    query.results = results;
//    
//    // Taking Done
//    
//    NSLog(@"Log: The json response in terms of foundation objects is - %@", query);
}


@end
