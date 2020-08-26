import React from "react";
import classNames from "classnames";
import _ from "lodash";

const BookSuggestion = ({ title, authors, authors_hits, highlights }) => {
  return (
    <div className="suggestion">
      <div
        className="book-suggestion__title"
        dangerouslySetInnerHTML={{
          __html: highlights && highlights.title ? highlights.title[0] : title,
        }}
      ></div>
      <span
        dangerouslySetInnerHTML={{
          __html: _.uniqBy(_.concat(authors_hits, authors), "id")
            .map((author) => {
              console.log(author);
              return author.highlights && author.highlights["authors.name"]
                ? author.highlights["authors.name"]
                : author.name;
            })
            .join(", "),
        }}
      ></span>
    </div>
  );
};

export default BookSuggestion;
