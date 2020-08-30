import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";

import { getAuthor } from "../../api";

const AuthorPage = () => {
  let { authorId } = useParams();
  let [author, setAuthor] = useState({});

  useEffect(() => {
    getAuthor(authorId).then(({ data }) => setAuthor(data));
  }, []);

  return <div>{author.name}</div>;
};

export default AuthorPage;
