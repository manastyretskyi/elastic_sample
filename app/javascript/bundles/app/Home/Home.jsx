import React, { useState, useEffect } from "react";
import axios from "axios";
import classNames from "classnames";
import Autosuggest from "react-autosuggest";

import useCSRFToken from "../hooks/useCSRFToken";

import "./Home.scss";
import BookSuggestion from "./components/BookSuggestion";
import AuthorSuggestion from "./components/AuthorSuggestion";

function getSuggestionValue(suggestion) {
  return suggestion.title;
}

function renderSuggestion(suggestion) {
  switch (suggestion.type) {
    case "book":
      return <BookSuggestion key={suggestion.id} {...suggestion} />;
    case "author":
      return <AuthorSuggestion key={suggestion.id} {...suggestion} />;
  }
}

const Home = (props) => {
  const [search, setSearch] = useState(props.search || "");
  const [suggestions, setSuggestions] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(false);
  const [shouldReload, setShouldReload] = useState(false);
  const token = useCSRFToken();

  const history = useEffect(() => {
    if (!shouldReload) return;
    setSuggestions([]);
    if (search === "") return;

    setLoading(true);
    setError(false);
    setShouldReload(false);

    axios
      .post(
        "/search",
        { term: search },
        {
          headers: {
            "X-CSRF-TOKEN": token,
            Accept: "application/json",
          },
        }
      )
      .then(({ data }) => setSuggestions(data))
      .catch(() => setError(true))
      .finally(() => setLoading(false));
  }, [search]);

  let onChange = (event, { newValue: term, method }) => {
    setSearch(term);
    if (method === "type") setShouldReload(true);
  };

  const inputProps = {
    placeholder: "Start typing...",
    value: search,
    onChange: onChange,
  };

  return (
    <div>
      <Autosuggest
        suggestions={suggestions}
        onSuggestionsFetchRequested={({ value }) => setSearch(value)}
        onSuggestionsClearRequested={() => setSuggestions([])}
        getSuggestionValue={getSuggestionValue}
        renderSuggestion={renderSuggestion}
        inputProps={inputProps}
        onSuggestionSelected={(event, { suggestion }) => {
          location.href = `http://0.0.0.0:3000/books/${suggestion.id}`;
        }}
      />
    </div>
  );
};

export default Home;
