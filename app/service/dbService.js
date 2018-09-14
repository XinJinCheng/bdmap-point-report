"use strict";

const logger = require('./logService')('dbService.js');

const config = require('../config');

const MariadbClient = require('mariasql');

class DbService {

    constructor(next) {
        this.next = next;
    }

    selectLatestSubmittedLocations(count) {
        return new Promise(function (resolve, reject) {
            let client = new MariadbClient(config.MARIADB);

            let selectTemplate =
                'SELECT `name`, `student`, `datetime`, `city`, `ip` FROM `submitted_location` ' +
                'WHERE `city` IS NOT NULL AND `city` != "" AND `datetime` IS NOT NULL ' +
                'ORDER BY `datetime` DESC, `id` DESC LIMIT ' + count;

            client.query(selectTemplate, function (e, rows) {
                if (e) {
                    logger.error(e.message);
                    reject(e.message)
                } else {
                    // logger.debug(rows);
                    resolve(rows);
                }
            });

            client.end();
        });
    }

    selectSubmittedLocationsByName(name) {
        return new Promise(function (resolve, reject) {
            let client = new MariadbClient(config.MARIADB);

            // logger.debug(name);
            let selectTemplate = client.prepare(
                'SELECT s.`city`, COUNT(*) AS count, p.`x`, p.`y` FROM `submitted_location` AS s LEFT JOIN `city_point` AS p ON s.`city` = p.`city` ' +
                'WHERE s.`name` = :name AND s.`city` IS NOT NULL AND s.`city` != "" AND p.`x` IS NOT NULL AND p.`y` IS NOT NULL ' +
                'GROUP BY `city`');

            client.query(selectTemplate({ name: name }), function (e, rows) {
                if (e) {
                    logger.error(e.message);
                    reject(e.message)
                } else {
                    // logger.debug(rows);
                    resolve(rows);
                }
            });

            client.end();

        });
    }

    insertSubmittedLocation(params) {

        return new Promise(function (resolve, reject) {

            let client = new MariadbClient(config.MARIADB);

            //write submitted survey record
            let insertSubmittedLocationTemplate = client.prepare(
                'INSERT INTO `submitted_location` ' +
                '(`name`, `student`, `ip`, `datetime`, `city`, `location`) ' +
                'VALUES (:name, :student, :ip, :datetime, :city, :location)');
            client.query(insertSubmittedLocationTemplate(params[0]), function (e, rows) {
                if (e) {
                    logger.error(e.message);
                    reject(e.message);
                } else {
                    // logger.debug(rows);
                    resolve(params);
                }
            });

            client.end();
        });
    }

    insertCityPoint(cityPoint) {
        return new Promise(function (resolve, reject) {

            let client = new MariadbClient(config.MARIADB);

            let insertCityPointTemplate = client.prepare(
                'INSERT INTO `city_point` ' +
                '(`city`, `x`, `y`, `location`) ' +
                'VALUES (:city, :x, :y, :location)');
            client.query(insertCityPointTemplate(cityPoint), function (e, rows) {
                if (e) {
                    if (e.code == 1062) {
                        logger.warn(e.message);
                        resolve(cityPoint);
                    } else {
                        logger.error(e.message);
                        reject(e.message);
                    }
                } else {
                    // logger.debug(rows);
                    resolve(cityPoint);
                }
            });

            client.end();
        });

    }
}

module.exports = DbService;