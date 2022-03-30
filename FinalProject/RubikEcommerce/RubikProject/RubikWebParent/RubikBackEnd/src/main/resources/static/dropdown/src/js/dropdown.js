/**
 *
 * @param {*} options options
 * @param {DOM node} options.wrapper DOM element that contains the trigger and the menu, required
 * @param {string} options.transformOrigin self explanatory, pass false to disable
 * @param {string} options.transition self explanatory, pass false to disable
 * @param {function} options.onClose self explanatory, receives the instance of the dropdown object
 * @param {function} options.onOpen self explanatory, receives the instance of the dropdown object
 * @returns {object} the instance
 */
function Dropdown({
  wrapper,
  transformOrigin = "top",
  transition = "all .15s ease-in-out",
  onClose = (instance) => null,
  onOpen = (instance) => null,
  visibleCss = { transform: "scale(1)", opacity: 1 },
  hiddenCss = { transform: "scale(0)", opacity: 0 },
} = {}) {
  if (!wrapper) return;
  //
  const instance = this;
  // attributes
  instance.wrapperAttr = "data-dropdown-wrapper";
  instance.triggerAttr = "data-dropdown-trigger";
  instance.menuAttr = "data-dropdown-menu";
  // elements
  instance.trigger = $(wrapper).find(`[${instance.triggerAttr}]`);
  instance.menu = $(wrapper).find(`[${instance.menuAttr}]`);
  // utils
  instance.setDefaultStyles = function () {
    if (transformOrigin) {
      instance.menu.css({ transformOrigin });
    }
    if (transition) {
      instance.menu.css({ transition });
    }
  };
  instance.menuIsOpen = function () {
    return !!instance.menu.attr(instance.menuAttr);
  };
  instance.showMenu = function () {
    instance.menu.css(visibleCss);
    instance.menu.attr(instance.menuAttr, "open");
    onOpen(instance);
  };
  instance.hideMenu = function () {
    instance.menu.css(hiddenCss);
    instance.menu.attr(instance.menuAttr, "");
    onClose(instance);
  };
  instance.handleTriggerClick = function () {
    instance.trigger.click((e) => {
      if (instance.menuIsOpen()) {
        instance.hideMenu();
      } else {
        instance.showMenu();
      }
    });
  };
  instance.handleOutsideClick = function () {
    const clickedOutsideDropdown = (clickedElement) => {
      return (
        $(clickedElement).parents(`[${instance.wrapperAttr}]`).length === 0
      );
    };
    $(document).click((event) => {
      const clickedElement = event.target;
      if (clickedOutsideDropdown(clickedElement)) {
        instance.hideMenu();
      }
    });
  };
  instance.initialCheck = function () {
    const openByDefault = !!instance.menu.attr(instance.menuAttr);
    if (openByDefault) {
      // do nothing
      instance.hideMenu();
    } else {
      // either way, close it
      instance.hideMenu();
    }
  };
  instance.init = function () {
    instance.setDefaultStyles();
    instance.initialCheck();
    // attach listeners
    instance.handleTriggerClick();
    instance.handleOutsideClick();
  };
  return instance;
}
