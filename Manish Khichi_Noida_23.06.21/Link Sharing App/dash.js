const profileDropdownButton = document.getElementById("profile-dropdown-button");
const profileDropdownContent = document.getElementById("profile-dropdown-content");
profileDropdownButton.addEventListener("click", () => {
  profileDropdownContent.classList.toggle("show")
})