import React, { useState, useEffect } from "react";
import classNames from "classnames";
import Autosuggest from "react-autosuggest";
import { useHistory } from "react-router-dom";

import BookSuggestion from "./components/BookSuggestion";
import AuthorSuggestion from "./components/AuthorSuggestion";

import { getSuggestionPath, getSuggestionValue } from "../../utils";
import { getSuggestions } from "../../api";

import "./Home.scss";

function renderSuggestion(suggestion) {
  switch (suggestion.type) {
    case "book":
      return <BookSuggestion key={`book:${suggestion.id}`} {...suggestion} />;
    case "author":
      return (
        <AuthorSuggestion key={`author:${suggestion.id}`} {...suggestion} />
      );
  }
}

const Home = (props) => {
  const [search, setSearch] = useState(props.search || "");
  const [suggestions, setSuggestions] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(false);
  const history = useHistory();

  useEffect(() => {
    setSuggestions([]);
    setError(false);
    if (search === "") return;

    setLoading(true);

    setTimeout(
      () =>
        getSuggestions(search)
          .then(({ data }) => setSuggestions(data))
          .catch(() => setError(true))
          .finally(() => setLoading(false)),
      500
    );
  }, [search]);

  let onChange = (event, { newValue: term, method }) => {
    if (method === "type") setSearch(term);
  };

  const inputProps = {
    placeholder: "Start typing...",
    value: search,
    onChange,
  };

  return (
    <div className={classNames({ loading, error })}>
      <Autosuggest
        suggestions={suggestions}
        onSuggestionsFetchRequested={({ value }) => setSearch(value)}
        onSuggestionsClearRequested={() => setSuggestions([])}
        getSuggestionValue={getSuggestionValue}
        renderSuggestion={renderSuggestion}
        inputProps={inputProps}
        onSuggestionSelected={(event, { suggestion }) =>
          history.push(getSuggestionPath(suggestion))
        }
      />
    </div>
  );
};

export default Home;
