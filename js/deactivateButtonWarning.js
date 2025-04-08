function confirmDeactivation() {
    const confirmation = document.getElementById("confirmText").value;
    if (confirmation !== "DEACTIVATE") {
        alert("The confirmation was unsuccesfull. Please type it exactly as: DEACTIVATE.");
        return false;
    }
    return confirm("Are you sure to deactivate your account?");
}

function removeAlert(element) {
    element.parentNode.remove()};