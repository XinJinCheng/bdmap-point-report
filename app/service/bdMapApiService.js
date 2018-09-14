"use strict";

const logger = require('./logService')('bdMapApiService.js');

const request = require("request-promise");

class bdMapApiService {

    constructor(params){
        this.ak = "4SUOswuyXWNUV5kSUGoxgQx4ms7lamxh";
    }

    findPointByIp(ip) {
        let option = {
            uri: 'http://api.map.baidu.com/location/ip?ip=' + ip + '&ak=' + this.ak + '&coor=bd09ll',
            json: true // Automatically parses the JSON string in the response
        };

        return new Promise(function(resolve, reject){
            request(option)
            .then(function (jsonResult) {
                // logger.debug(jsonResult);
                if (!jsonResult || jsonResult.status != 0) {
                    logger.debug(jsonResult.status);
                    return;
                }
                logger.debug(jsonResult.content.address);
                logger.debug(jsonResult.content.point);

                resolve(jsonResult);                
            })
            .catch(function (e) {
                logger.error(e);
                reject(e);
            });
        });
    }
}

module.exports = bdMapApiService;