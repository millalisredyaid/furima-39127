window.addEventListener('load', () => {
  console.log("OK");
  const priceInput = document.getElementById("item-price");
  
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    
    const addTaxDom = document.getElementById("add-tax-price");
    const commission = Math.floor(inputValue * 0.1); // 入力された金額から10%の手数料を計算
    addTaxDom.innerHTML = `${commission.toLocaleString()}`; // 計算結果を表示

    const profitDom = document.getElementById("profit");
    const profit = inputValue - commission; // 入力された金額から手数料を引いた利益を計算
    profitDom.innerHTML = `${profit.toLocaleString()}`; // 計算結果を表示
    

  })
});
