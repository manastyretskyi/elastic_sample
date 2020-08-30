import React from "react";

const AuthorSuggestion = ({ name, highlights }) => {
  return (
    <div className="suggestion">
      <div
        className="author-suggestion__name"
        dangerouslySetInnerHTML={{
          __html: highlights && highlights.name ? highlights.name[0] : name,
        }}
      ></div>
    </div>
  );
};

export default AuthorSuggestion;
