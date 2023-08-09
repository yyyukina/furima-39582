window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      const addProfitDom = document.getElementById("profit");

      const inputValue = parseInt(priceInput.value, 10);

      const tax = Math.floor(inputValue * 0.1); 
      addTaxDom.innerHTML = tax;

      const profit = inputValue - tax;
      addProfitDom.innerHTML = profit;
  });
});