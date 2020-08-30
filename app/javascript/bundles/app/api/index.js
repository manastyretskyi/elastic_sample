import axios from "axios";
import useCSRFToken from "../hooks/useCSRFToken";

const request = () =>
  axios.create({
    baseURL: "/api/",
    headers: {
      Accept: "application/json",
      "X-CSRF-TOKEN": useCSRFToken(),
      "Content-Type": "application/json",
    },
  });

export const getSuggestions = (term) => request().post("search", { term });

export const getBook = (id) => request().get(`books/${id}`);

export const getAuthor = (id) => request().get(`authors/${id}`);
