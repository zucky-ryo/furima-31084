window.addEventListener('turbolinks:load', () => {
  let urlPath = location.pathname;
  if (urlPath == '/items/new' || urlPath == '/items') {
    const form = document.getElementById("item-price");
    const tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    form.addEventListener('input', () => {
      let price = parseInt(form.value, 10);
      let taxRes = parseInt(price / 10);
      let profitRes = parseInt(price / 10 * 9);
      tax.innerHTML = taxRes.toLocaleString();
      profit.innerHTML = profitRes.toLocaleString();
    });
  }
});