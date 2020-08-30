import React from "react";
import { useParams } from "react-router-dom";

const AuthorPage = () => {
  let { authorId } = useParams();

  return <div>{authorId}</div>;
};

export default AuthorPage;
