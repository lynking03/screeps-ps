export const changeOrderPriceImpl = (orderId, newPrice) => Game.market.changeOrderPrice(orderId, newPrice);
export const createOrderImpl = (params) => Game.market.createOrder(params);
export const dealImpl = (orderId, amount) => Game.market.deal(orderId, amount);
export const dealYourRoomNameImpl = (orderId, amount, yourRoomName) => Game.market.deal(orderId, amount, yourRoomName);
