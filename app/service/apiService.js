"use strict";

const model = require('../model');
const IpLocationService = require('./ipLocationService');
const config = require('../config');

const MariadbClient = require('mariasql');
const request = require("request");

const logger = require('./logService')('apiService.js');

class ApiService {

    constructor(responsor){
        this.responsor = responsor;
        // logger.debug(responsor);
    }

    addSurveySubmit(params) {

        let _this = this;

        let locationService = new IpLocationService();
        let location = locationService.findCityByIp(params.ip);

        let client = new MariadbClient(config.MARIADB);

        let insertSubmittedLocationTemplate = client.prepare(
            'INSERT INTO `submitted_location` ' +
            '(`name`, `ip`, `datetime`, `city`, `location`) ' +
            'VALUES (:name, :ip, :datetime, :city, :location)');

        let insertCityPointTemplate = client.prepare(
            'INSERT INTO `city_point` ' +
            '(`city`, `x`, `y`, `location`) ' +
            'VALUES (:city, :x, :y, :location)');

        request('http://api.map.baidu.com/location/ip?ip=1.180.120.242&ak=4SUOswuyXWNUV5kSUGoxgQx4ms7lamxh&coor=bd09ll', 
            function (error, response, body) {
                if (!error && response.statusCode == 200) {
                    // logger.debug(body) // Show the HTML for the baidu homepage.
                    let jsonResult = JSON.parse(body);
                    // logger.debug(jsonResult);
                    if(jsonResult && jsonResult.status == 0){
                        // logger.debug(jsonResult.content.address_detail.city);
                        // logger.debug(jsonResult.content.point);
                        client.query(insertCityPointTemplate({city: location.city, x: jsonResult.content.point.x, y: jsonResult.content.point.y, location: JSON.stringify(jsonResult)}), 
                            function (e, rows) {
                                if (e) {
                                    logger.error(e);
                                }else{
                                    logger.debug('insertCityPointTemplate');
                                    logger.debug(rows);
                                }
                        });
                    }
                }
            }
        );
        
        let surveySubmit = new model.SurveySubmit({
            name: params.name,
            ip: params.ip,
            datetime: params.datetime,
            city: location.city,
            location: JSON.stringify(location.detail)
        });
        client.query(insertSubmittedLocationTemplate(surveySubmit), function (e, rows) {
            if (e) {
                logger.error(e);
                _this.responsor.sendResponse(400, e.message);
            }else{
                logger.debug('insertSubmittedLocationTemplate');
                logger.debug(rows);
                _this.responsor.sendResponse(200, rows);
            }
        });

        client.end();
    }

    querySurveySubmitsByName(name) {

        let _this = this;
        // logger.debug(_this)

        //Only for test use
        if(!name){
            _this.responsor.sendResponse(200, []);
            return;
        }

        let client = new MariadbClient(config.MARIADB);

        // logger.debug(name);
        let selectTemplate = client.prepare(
            'SELECT s.`city`, COUNT(*) AS count, p.`x`, p.`y` FROM `submitted_location` AS s LEFT JOIN `city_point` AS p ON s.`city` = p.`city` ' + 
            'WHERE s.`name` = :name AND s.`city` IS NOT NULL AND s.`city` != "" AND p.`x` IS NOT NULL AND p.`y` IS NOT NULL ' + 
            'GROUP BY `city`');

        client.query(selectTemplate({name: name}), {useArray: true}, function (e, rows) {
            if (e) {
                logger.error(e);
                _this.responsor.sendResponse(400, e.message);
            }else{
                // logger.debug(rows);
                _this.responsor.sendResponse(200, rows);
            }
        });
/*
        let insertTemplate = client.prepare(
            'INSERT INTO `submitted_location` ' +
            '(`name`, `ip`, `datetime`, `city`, `location`) ' +
            'VALUES (:name, :ip, :datetime, :city, :location)');

        client.query(insertTemplate(surveySubmit), function (e, rows) {
            if (e) {
                logger.error(e);
                _this.responsor.sendResponse(400, e.message);
            }else{
                logger.debug(rows);
                _this.responsor.sendResponse(200, rows);
            }
        });
*/
        client.end();
        
        // let surveySubmit = new model.SurveySubmit({});
        // console.log(surveySubmit);
        // return surveySubmit;
    }

    queryAllSurveySubmitsGroupByName() {

        let _this = this;
        // logger.debug(_this)

        let client = new MariadbClient(config.MARIADB);

        // let selectNames = 'SELECT DISTINCT `name` FROM `submitted_location`';
        client.query(selectNames, null, {useArray: true}, function (e, rows) {
            if (e) {
                logger.error(e);
                _this.responsor.sendResponse(400, e.message);
            }else{
                logger.debug(rows);
                let names = [].concat.apply([], rows);
                _this.responsor.sendResponse(200, names);

            }
        });
/*
        let insertTemplate = client.prepare(
            'INSERT INTO `submitted_location` ' +
            '(`name`, `ip`, `datetime`, `city`, `location`) ' +
            'VALUES (:name, :ip, :datetime, :city, :location)');

        client.query(insertTemplate(surveySubmit), function (e, rows) {
            if (e) {
                logger.error(e);
                _this.responsor.sendResponse(400, e.message);
            }else{
                logger.debug(rows);
                _this.responsor.sendResponse(200, rows);
            }
        });
*/
        client.end();
        
        // let surveySubmit = new model.SurveySubmit({});
        // console.log(surveySubmit);
        // return surveySubmit;
    }

    // insertOne(client){
    //     let p = new Promise((resolve, reject) => {
    //         client.query(insertTemplate(surveySubmit), function (e, rows) {
    //             if (e) {
    //                 reject(e);
    //             }else{
    //                 resolve(rows);
    //             }
    //         });
    //     });
    //     return p;
    // }
}

module.exports = ApiService;