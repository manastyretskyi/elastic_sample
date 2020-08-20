import React from "react";
import classNames from "classnames";

const BookSuggestion = ({ title, authors }) => {
  return (
    <div className="suggestion">
      <div className="book-suggestion__title">{title}.</div>
      <span>{authors.map((author) => author.name).join(", ")}</span>
    </div>
  );
};

export default BookSuggestion;
