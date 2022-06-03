let SunmiPrinter = {

    printerInit: function (resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "printerInit", []);
    },
    printerSelfChecking: function (resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "printerSelfChecking", []);
    },
    getPrinterSerialNo: function (resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "getPrinterSerialNo", []);
    },
    getPrinterVersion: function (resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "getPrinterVersion", []);
    },
    hasPrinter: function (resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "hasPrinter", []);
    },
    getPrintedLength: function (resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "getPrintedLength", []);
    },
    cutPaper: function(resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "cutPaper", []);
    }
    lineWrap: function (count, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "lineWrap", [count]);
    },
    sendRAWData: function (base64Data, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "sendRAWData", [base64Data]);
    },
    setAlignment: function (alignment, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "setAlignment", [alignment]);
    },
    setFontName: function (typeface, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "setFontName", [typeface]);
    },
    setFontSize: function (fontSize, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "setFontSize", [fontSize]);
    },
    printTextWithFont: function (text, typeface, fontSize, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "printTextWithFont", [text, typeface, fontSize]);
    },
    printColumnsText: function (colsTextArr, colsWidthArr, colsAlign, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "printColumnsText", [colsTextArr, colsWidthArr, colsAlign]);
    },
    printBitmap: function (base64Data, width, height, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "printBitmap", [base64Data, width, height]);
    },
    printBarCode: function (barCodeData, symbology, width, height, textPosition, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "printBarCode", [barCodeData, symbology, width, height, textPosition]);
    },
    printQRCode: function (qrCodeData, moduleSize, errorLevel, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "printQRCode", [qrCodeData, moduleSize, errorLevel]);
    },
    printOriginalText: function (text, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "printOriginalText", [text]);
    },
    printString: function (text, resolve, reject) {
        cordova.exec(resolve, reject, "Printer", "printString", [text]);
    },
    printerStatusStartListener: function (onSuccess, onError) {
        cordova.exec(onSuccess, onError, "Printer", "printerStatusStartListener", []);
    },
    printerStatusStopListener: function () {
        cordova.exec(function () {}, function () {}, "Printer", "printerStatusStopListener", []);
    }
}

module.exports = { SunmiPrinter };