import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import { getBook } from "../../api";

const BookPage = () => {
  let { bookId } = useParams();
  let [book, setBook] = useState({});

  useEffect(() => {
    getBook(bookId).then(({ data }) => setBook(data));
  }, []);

  return <div>{book.title}</div>;
};

export default BookPage;
