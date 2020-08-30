import React from "react";
import { useParams } from "react-router-dom";

const BookPage = () => {
  let { bookId } = useParams();

  return <div>{bookId}</div>;
};

export default BookPage;
