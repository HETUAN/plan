define(["../Scripts/jquery-2.1.1.min"], function ($) {
    //return an object to define the "my/shirt" module.
    return {
        color: "blue",
        size: "large",
        addToCart: function () {
            inventory.decrement(this);
            cart.add(this);
        }
    }
}
);