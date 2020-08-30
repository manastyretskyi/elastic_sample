import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";

import { getApiBookPath } from "../../routes/paths";

const BookPage = () => {
  let { bookId } = useParams();
  let [book, setBook] = useState({});

  useEffect(() => {
    axios
      .get(getApiBookPath(bookId), {
        headers: {
          Accept: "application/json",
        },
      })
      .then(({ data }) => setBook(data));
  }, []);

  return <div>{book.title}</div>;
};

export default BookPage;
