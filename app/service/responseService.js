"use strict";

const logger = require('./logService')('responseService.js');

class ResponseService {

    constructor(res) {
        this.res = res;
    }

    sendResponse(code, o) {
        this.res.status(code);
        logger.debug(code);
        this.res.json(o)
        logger.debug(o);

    }

}

module.exports = ResponseService;
