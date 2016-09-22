define(['jquery'], function ($) {
    //return an object to define the "my/shirt" module.
    var User = function () { }
    User.prototype.LoadData = function () {
        $.get("/User/GetModel", function (data) {
            if (data != null) {
                $("#UserName").text("你好：" + data.Name);
            }
        })
    }
    return {
        User: User
    }
}
);