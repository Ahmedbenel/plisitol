const addChild = () => {
  const addChildForm = document.querySelector(".child-add-form");
  const btnPlus = document.querySelector("#create-child");

  if (btnPlus) {
    btnPlus.addEventListener("click", () => {
      addChildForm.classList.remove("disable");
      addChildForm.classList.add("active");
      btnPlus.classList.add("disable");
    })
  }
}

const addAccount = () => {
  const addAccountForm = document.querySelector(".account-add-form");
  const btnAddAccount = document.querySelector("#add-account");

  if (btnAddAccount) {
    btnAddAccount.addEventListener("click", () => {
      addAccountForm.classList.remove("disable");
      addAccountForm.classList.add("active");
      btnAddAccount.classList.add("disable");
    })
  }
}

export { addChild }
export { addAccount }
