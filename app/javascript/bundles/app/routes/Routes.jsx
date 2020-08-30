import React from "react";
import { Switch, Route } from "react-router-dom";
import { homePagePath, bookPagePath, authorPagePath } from "./paths";
import Home from "../pages/Home";
import BookPage from "../pages/BookPage";
import AuthorPage from "../pages/AuthorPage";

const Routes = () => {
  return (
    <Switch>
      <Route path={homePagePath} component={Home} exact />
      <Route path={bookPagePath} component={BookPage} exact />
      <Route path={authorPagePath} component={AuthorPage} exact />
    </Switch>
  );
};

export default Routes;
