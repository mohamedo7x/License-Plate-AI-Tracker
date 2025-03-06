"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.errHandler = void 0;
const errHandler = (err, _, res, __) => {
    if (process.env.S_STATUS === 'env') {
        res.status(500).send('Oops, an unexpected error occurred' + err);
        return;
    }
    res.status(500).send('Oops, an unexpected error occurred, please try again');
    return;
};
exports.errHandler = errHandler;
