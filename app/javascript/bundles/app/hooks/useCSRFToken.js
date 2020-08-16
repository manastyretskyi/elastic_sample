const useCSRFToken = () => {
  const csrfTokenEl = document.querySelector("[name=csrf-token]");
  return csrfTokenEl.content || "";
};

export default useCSRFToken;
