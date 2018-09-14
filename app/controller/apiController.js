"use strict";

const model = require('../model');
const service = require('../service');
const config = require('../config');

const dbService = new service.DbService();
const bdMapService = new service.BdMapApiService();
const logger = service.getLogger('apiService.js');

class ApiController {

    constructor() {
        this.ak = "4SUOswuyXWNUV5kSUGoxgQx4ms7lamxh"
    }

    addSurveySubmit(params) {

        return new Promise(function (resolve, reject) {

            if (!params) {
                reject("invalid params");
            }

            bdMapService.findPointByIp(params.ip)
                .then(function (location) {
                    let cityPoint = new model.CityPoint({
                        city: location.content.address_detail.city,
                        x: location.content.point.x,
                        y: location.content.point.y,
                        location: JSON.stringify(location)
                    });

                    return dbService.insertCityPoint(cityPoint);
                })
                .then(function (cityPoint) {
                    let surveySubmit = new model.SurveySubmit({
                        name: params.name,
                        student: params.student,
                        ip: params.ip,
                        datetime: params.datetime,
                        city: cityPoint.city,
                        location: JSON.stringify(cityPoint.location)
                    });

                    return dbService.insertSubmittedLocation([surveySubmit, cityPoint]);
                })
                .then(function (feedback) {
                    resolve(feedback);
                })
                .catch(function (e) {
                    reject(e);
                });

        });
    }

    // addSurveySubmits(params) {

    //     return new Promise(function (resolve, reject) {

    //         if (!params || params.length < 1) {
    //             reject("invalid params");
    //         }

    //         let t = 0, f = 0;
    //         for(let i = 0; i < params.length; i++){
    //             this.addSurveySubmit(params[i])
    //             .then(function(feedback){
    //                 t++;
    //             })
    //             .catch(function(e){
    //                 f++;
    //             });
    //         }

    //         if(f<=0){
    //             resolve("batch operation complete: " + t + " in total");
    //         }else{
    //             reject("batch operation complete with error: " + t + " success, " + f + " failure");
    //         }
    //     });
    // }

    querySurveySubmitsByName(name) {

        return new Promise(function (resolve, reject) {
            if (!name) {
                reject("invalid param [name]");
            }

            dbService.selectSubmittedLocationsByName(name)
                .then(function (data) {
                    resolve(data);
                })
                .catch(function (e) {
                    reject(e);
                });
        });
    }

    queryLatestSurveySubmits(count) {

        return new Promise(function (resolve, reject) {
            if (!count) {
                reject("invalid param [count]");
            }

            dbService.selectLatestSubmittedLocations(count)
                .then(function (data) {
                    resolve(data);
                })
                .catch(function (e) {
                    reject(e);
                });
        });

    }

}

module.exports = ApiController;