function handleDropdowns() {
  const dropdowns = $("[data-dropdown-wrapper]").each(function (
    index,
    wrapper,
    transformOrigin
  ) {
    const dropdown = new Dropdown({ wrapper, 
    	transformOrigin: "top",
    	transition: "all .15s ease-in-out",
    	onClose: (instance) => null,
    	onOpen: (instance) => null,
    	visibleCss: { transform: "scale(1)", opacity: 1 },
    	hiddenCss: { transform: "scale(0)", opacity: 0 },
    	}).init();
  });
}
$(function () {
	handleDropdowns();
});