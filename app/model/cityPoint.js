"use strict";

class CityPoint {

    constructor(params) {
        this.id = params.id;
        this.city = params.city;
        this.x = params.x;
        this.y = params.y;
        this.location = params.location;
    }
}

module.exports = CityPoint;