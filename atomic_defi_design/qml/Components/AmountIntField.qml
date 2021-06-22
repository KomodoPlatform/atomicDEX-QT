import QtQuick 2.15

TextFieldWithTitle {
    field.validator: RegularExpressionValidator {
        regularExpression: /[0-9]+/
    }
}
