window.addEventListener('turbo:load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

  const Profit = document.getElementById("profit");
  Profit.innerHTML = Math.ceil(inputValue - (inputValue * 0.1));
  //console.log(inputValue);
})
});