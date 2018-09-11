"use strict";

const model = require('../model');
const IpLocationService = require('./ipLocationService');
const config = require('../config');
const MariadbClient = require('mariasql');
const logger = require('./logService')('apiService.js');

class ApiService {

    constructor(responsor){
        this.responsor = responsor;
        // logger.debug(responsor);
    }

    addSurveySubmit(params) {

        logger.debug(params);

        let locationService = new IpLocationService();
        let location = locationService.findCityByIp(params.ip);
        logger.debug(location);

        let surveySubmit = new model.SurveySubmit({
            name: params.name,
            ip: params.ip,
            datetime: params.datetime,
            city: location.city,
            location: JSON.stringify(location.detail)
        });

        logger.debug(surveySubmit);

        let client = new MariadbClient(config.MARIADB);

        let insertTemplate = client.prepare(
            'INSERT INTO `submitted_location` ' +
            '(`name`, `ip`, `datetime`, `city`, `location`) ' +
            'VALUES (:name, :ip, :datetime, :city, :location)');

        let _this = this;
        // logger.debug(_this)
        client.query(insertTemplate(surveySubmit), function (e, rows) {
            if (e) {
                logger.error(e);
                _this.responsor.sendResponse(400, e.message);
            }else{
                // logger.debug(rows);
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
        let selectTemplate = client.prepare('SELECT `city`, count(*) as count FROM `submitted_location` WHERE `city` IS NOT NULL AND `city` != "" AND `name` = :name GROUP BY `city`');
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