import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";

import { getApiAuthorPath } from "../../routes/paths";

const AuthorPage = () => {
  let { authorId } = useParams();
  let [author, setAuthor] = useState({});

  useEffect(() => {
    axios
      .get(getApiAuthorPath(authorId), {
        headers: {
          Accept: "application/json",
        },
      })
      .then(({ data }) => setAuthor(data));
  }, []);

  return <div>{author.name}</div>;
};

export default AuthorPage;
