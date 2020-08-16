import React, { useState, useEffect } from "react";
import axios from "axios";
import classNames from "classnames";

import useCSRFToken from "../hooks/useCSRFToken";

import "./Home.scss";

const Home = (props) => {
  const [search, setSearch] = useState(props.search || "");
  const [result, setResult] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(false);

  const token = useCSRFToken();

  useEffect(() => {
    setResult([]);
    if (search === "") return;

    setLoading(true);
    setError(false);

    axios
      .post(
        "/search",
        { search },
        {
          headers: {
            "X-CSRF-TOKEN": token,
            Accept: "application/json",
          },
        }
      )
      .then(({ data }) => setResult(data))
      .catch(() => setError(true))
      .finally(() => setLoading(false));
  }, [search]);

  return (
    <div>
      <div className={classNames({ error, loading })}>Hello, {search}</div>
      <input
        type="string"
        value={search}
        onChange={(e) => setSearch(e.currentTarget.value)}
      />
      {result.map((book) => (
        <div key={book.id}>{book.title}</div>
      ))}
    </div>
  );
};

export default Home;
