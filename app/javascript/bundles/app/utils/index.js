import { getBookPath, getAuthorPath } from "../routes/paths";

export function getSuggestionValue(suggestion) {
  switch (suggestion.type) {
    case "book":
      return suggestion.title;
    case "author":
      return suggestion.name;
  }
}

export function getSuggestionPath(suggestion) {
  switch (suggestion.type) {
    case "book":
      return getBookPath(suggestion.id);
    case "author":
      return getAuthorPath(suggestion.id);
    default:
      return "/404";
  }
}
