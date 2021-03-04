'use strict';
const axios = require(`axios`);

const {Methods} = require(`../consts`);

class API {
  constructor(baseURL, timeout) {
    this._http = axios.create({
      baseURL,
      timeout
    });
  }

  async _request(url, options, token) {
    const headers = token ? {authorization: `Bearer ${token}`} : {};
    const response = await this._http.request({url, ...options, headers});
    return response.data;
  }

  getArticles({page = 1, isWithComments = false, categoryId = null} = {}) {
    return this._request(`/articles`, {params: {page, isWithComments, categoryId}});
  }

  getArticlesForAuthor({page = 1, isWithComments = false} = {}, token) {
    return this._request(`/articles/author`, {params: {page, isWithComments}}, token);
  }

  getArticle(id) {
    return this._request(`/articles/${id}`);
  }

  search(query) {
    return this._request(`/search`, {params: {query}});
  }

  getCategories({isWithCount = false} = {}) {
    return this._request(`/categories`, {params: {isWithCount}});
  }

  createArticle(data, token) {
    return this._request(`/articles`, {
      method: Methods.POST,
      data
    }, token);
  }

  updateArticle(id, data, token) {
    return this._request(`/articles/${id}`, {
      method: Methods.PUT,
      data
    }, token);
  }

  addUser(data) {
    return this._request(`/users`, {
      method: Methods.POST,
      data
    });
  }

  authUser(data) {
    return this._request(`/auth`, {
      method: Methods.POST,
      data
    });
  }

  refreshAuthUser(data) {
    return this._request(`/auth/refresh`, {
      method: Methods.POST,
      data
    });
  }

  static getDefaultAPI() {
    const url = `${process.env.API_DOMAIN_URL}:${process.env.API_SERVICE_PORT}${process.env.API_PREFIX}`;
    return new this(url, +process.env.TIMEOUT);
  }
}


module.exports = API;
