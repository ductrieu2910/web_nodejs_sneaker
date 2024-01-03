const express = require("express");
const router = express.Router();
const apiProduct = require("../../api/user/apiProduct");
const apiAuth = require("../../api/user/apiAuth");
const apiOrder = require("../../api/user/apiOrder");
const apiCategory = require("../../api/user/apiCategory");
const cart = require("../../store/cart");
const middleware = require("../../middleware/middleware");

router.get("/", apiProduct.getProductHome);

router.get("/login", middleware.checkAuth);
router.get("/register", (req, res) => {
  let erro = req.flash("erro");
  let success = req.flash("success");
  res.render("user/register.ejs", { success, erro });
});
router.post("/loginUser", apiAuth.handleLogin);
router.post("/registerUser", apiAuth.handleRegister);
router.get("/logout", (req, res) => {
  res.cookie("token", "", { maxAge: 0 });
  res.cookie("UserId", "", { maxAge: 0 });
  return res.redirect("/login");
});

router.get("/detail/:id", apiProduct.getProductDetail);

router.post("/addCart", cart.handleAddCart);
router.get("/cart", (req, res) => {
  let erro = req.flash("erro");
  let success = req.flash("success");
  let carts = req.session.cart;
  return res.render("user/cart.ejs", { carts, success, erro });
});
router.get("/deleteCart/:id", cart.deleteCart);
router.get("/increaseCart/:id", cart.upCart);
router.get("/decreaseCart/:id", cart.deCart);

router.post("/order", middleware.checkRequireLogin, apiOrder.order);
router.get("/order/:id", middleware.checkRequireLogin, apiOrder.getOrderWait);
router.get(
  "/orderShip/:id",
  middleware.checkRequireLogin,
  apiOrder.getOrderShip
);
router.get(
  "/orderComplete/:id",
  middleware.checkRequireLogin,
  apiOrder.getOrderComplete
);
router.get(
  "/orderCancel/:id",
  middleware.checkRequireLogin,
  apiOrder.getOrderCancel
);
router.get(
  "/actionConfirmOrder/:order_id",
  middleware.checkRequireLogin,
  apiOrder.handleConfirmOrder
);
router.get(
  "/actionCancelOrder/:order_id",
  middleware.checkRequireLogin,
  apiOrder.handleCancelOrder
);

router.get("/categories/:category_id", apiCategory.getProductCategory);

module.exports = router;
