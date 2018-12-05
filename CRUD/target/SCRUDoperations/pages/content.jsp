<%--
  Created by IntelliJ IDEA.
  User: jock2
  Date: 30.11.2018
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="${pageContext.request.contextPath}/webjars/bootstrap/3.1.0/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="/resources/css/basic.css" rel="stylesheet">

    <script src="<c:url value="${pageContext.request.contextPath}/webjars/jquery/1.9.0/jquery.min.js"  />"></script>
    <script src="<c:url value="${pageContext.request.contextPath}/webjars/bootstrap/3.1.0/js/bootstrap.js"  />"></script>

    <title>CRUD - ${title}</title>
</head>
</tab>
<c:import url="page_components/header.jsp"></c:import>
<div class="container" >
    <div class="row">
        <div class="col-lg-10 col-lg-offset-1">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <div class="text-center">
                        <h1>${title}<small> crud operations</small></h1>
                    </div>
                </div>
                <div class="alert alert-info" role="alert">
                    <a class="btn btn-primary" role="button" href="/${instrument}/pdfReport?view=pdfView" target="_blank">Download PDF report</a>
                    <a class="btn btn-primary" role="button" href="/${instrument}/xlsxReport.xlsx?view=excelView" target="_blank">Download Excel report</a>
                </div>
                <div class="panel-body">
                    <div class="panel panel-info">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <div class="text-center"><h3>Brands</h3></div>
                        </div>
                        <table class="table table-striped table-condensed" id="car-brands">
                            <thead>
                            <th><button class="sort" data-sort="brand-name">brand</button></th>
                            <th><button class="sort" data-sort="founded-year">founded</button></th>
                            <th><button class="sort" data-sort="headquarter">headquarter</button></th>
                            <th>action</th>
                            </thead>
                            <tbody align="center" class="list">
                            <c:forEach var="brand" items="${listCarBrand}" varStatus="status">
                                <tr>
                                    <td class="brand-name">${brand.name}</td>
                                    <td class="founded-year">${brand.foundedYear}</td>
                                    <td class="headquarter">${brand.headquarter}</td>
                                    <td class="action">
                                        <a href="/${instrument}/edit-brand/${brand.idBrand}">Edit</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="/${instrument}/delete-brand/${brand.idBrand}">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="panel-footer"><a class="btn btn-info" role="button" href="/${instrument}/newBrand">Add new brand &raquo</a></div>
                    </div>

                    <div class="panel panel-info">
                        <!-- Default panel contents -->
                        <div class="panel-heading">
                            <div class="text-center"><h3>Models</h3></div>
                        </div>
                        <table class="table table-striped table-condensed" id="car-models">
                            <thead>
                            <th><button class="sort" data-sort="brand-name">brand</button></th>
                            <th><button class="sort" data-sort="model-name">model</button></th>
                            <th><button class="sort" data-sort="generation">generation</button></th>
                            <th><button class="sort" data-sort="production-year">produced</button></th>
                            <th><button class="sort" data-sort="doors">doors</button></th>
                            <th><button class="sort" data-sort="seats">seats</button></th>
                            <th><button class="sort" data-sort="maximum-speed">max speed</button></th>
                            <th>action</th>
                            </thead>
                            <tbody align="center" class="list">
                            <c:forEach var="model" items="${listCarModel}" varStatus="status">
                                <tr>
                                    <td class="brand-name">${model.carBrand.name}</td>
                                    <td class="model-name">${model.modelName}</td>
                                    <td class="generation">${model.generation}</td>
                                    <td class="production-year">${model.productionYear}</td>
                                    <td class="doors">${model.doors}</td>
                                    <td class="seats">${model.seats}</td>
                                    <td class="maximum-speed">${model.maximumSpeed}</td>
                                    <td>
                                        <a href="/${instrument}/edit-model/${model.idModel}">Edit</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="/${instrument}/delete-model/${model.idModel}">Delete</a>
                                    </td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="panel-footer"><a class="btn btn-info" role="button" href="/${instrument}/newModel">Add new model &raquo</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<script src="/resources/js/list.min.js"></script>
<script src="/resources/js/content-list.js"></script> --%>

<script type="text/javascript">
    !function a(b, c, d) {
        function e(g, h) {
            if (!c[g]) {
                if (!b[g]) {
                    var i = "function" == typeof require && require;
                    if (!h && i)return i(g, !0);
                    if (f)return f(g, !0);
                    var j = new Error("Cannot find module '" + g + "'");
                    throw j.code = "MODULE_NOT_FOUND", j
                }
                var k = c[g] = {exports: {}};
                b[g][0].call(k.exports, function (a) {
                    var c = b[g][1][a];
                    return e(c ? c : a)
                }, k, k.exports, a, b, c, d)
            }
            return c[g].exports
        }

        for (var f = "function" == typeof require && require, g = 0; g < d.length; g++)e(d[g]);
        return e
    }({
        1: [function (a, b, c) {
            !function (c, d) {
                "use strict";
                var e = c.document, f = a("./src/utils/get-by-class"), g = a("./src/utils/extend"), h = a("./src/utils/index-of"), i = a("./src/utils/events"), j = a("./src/utils/to-string"), k = a("./src/utils/natural-sort"), l = a("./src/utils/classes"), m = a("./src/utils/get-attribute"), n = a("./src/utils/to-array"), o = function (b, c, p) {
                    var q, r = this, s = a("./src/item")(r), t = a("./src/add-async")(r);
                    q = {
                        start: function () {
                            r.listClass = "list", r.searchClass = "search", r.sortClass = "sort", r.page = 1e4, r.i = 1, r.items = [], r.visibleItems = [], r.matchingItems = [], r.searched = !1, r.filtered = !1, r.searchColumns = d, r.handlers = {updated: []}, r.plugins = {}, r.valueNames = [], r.utils = {
                                getByClass: f,
                                extend: g,
                                indexOf: h,
                                events: i,
                                toString: j,
                                naturalSort: k,
                                classes: l,
                                getAttribute: m,
                                toArray: n
                            }, r.utils.extend(r, c), r.listContainer = "string" == typeof b ? e.getElementById(b) : b, r.listContainer && (r.list = f(r.listContainer, r.listClass, !0), r.parse = a("./src/parse")(r), r.templater = a("./src/templater")(r), r.search = a("./src/search")(r), r.filter = a("./src/filter")(r), r.sort = a("./src/sort")(r), this.handlers(), this.items(), r.update(), this.plugins())
                        }, handlers: function () {
                            for (var a in r.handlers)r[a] && r.on(a, r[a])
                        }, items: function () {
                            r.parse(r.list), p !== d && r.add(p)
                        }, plugins: function () {
                            for (var a = 0; a < r.plugins.length; a++) {
                                var b = r.plugins[a];
                                r[b.name] = b, b.init(r, o)
                            }
                        }
                    }, this.reIndex = function () {
                        r.items = [], r.visibleItems = [], r.matchingItems = [], r.searched = !1, r.filtered = !1, r.parse(r.list)
                    }, this.toJSON = function () {
                        for (var a = [], b = 0, c = r.items.length; c > b; b++)a.push(r.items[b].values());
                        return a
                    }, this.add = function (a, b) {
                        if (0 !== a.length) {
                            if (b)return void t(a, b);
                            var c = [], e = !1;
                            a[0] === d && (a = [a]);
                            for (var f = 0, g = a.length; g > f; f++) {
                                var h = null;
                                e = r.items.length > r.page ? !0 : !1, h = new s(a[f], d, e), r.items.push(h), c.push(h)
                            }
                            return r.update(), c
                        }
                    }, this.show = function (a, b) {
                        return this.i = a, this.page = b, r.update(), r
                    }, this.remove = function (a, b, c) {
                        for (var d = 0, e = 0, f = r.items.length; f > e; e++)r.items[e].values()[a] == b && (r.templater.remove(r.items[e], c), r.items.splice(e, 1), f--, e--, d++);
                        return r.update(), d
                    }, this.get = function (a, b) {
                        for (var c = [], d = 0, e = r.items.length; e > d; d++) {
                            var f = r.items[d];
                            f.values()[a] == b && c.push(f)
                        }
                        return c
                    }, this.size = function () {
                        return r.items.length
                    }, this.clear = function () {
                        return r.templater.clear(), r.items = [], r
                    }, this.on = function (a, b) {
                        return r.handlers[a].push(b), r
                    }, this.off = function (a, b) {
                        var c = r.handlers[a], d = h(c, b);
                        return d > -1 && c.splice(d, 1), r
                    }, this.trigger = function (a) {
                        for (var b = r.handlers[a].length; b--;)r.handlers[a][b](r);
                        return r
                    }, this.reset = {
                        filter: function () {
                            for (var a = r.items, b = a.length; b--;)a[b].filtered = !1;
                            return r
                        }, search: function () {
                            for (var a = r.items, b = a.length; b--;)a[b].found = !1;
                            return r
                        }
                    }, this.update = function () {
                        var a = r.items, b = a.length;
                        r.visibleItems = [], r.matchingItems = [], r.templater.clear();
                        for (var c = 0; b > c; c++)a[c].matching() && r.matchingItems.length + 1 >= r.i && r.visibleItems.length < r.page ? (a[c].show(), r.visibleItems.push(a[c]), r.matchingItems.push(a[c])) : a[c].matching() ? (r.matchingItems.push(a[c]), a[c].hide()) : a[c].hide();
                        return r.trigger("updated"), r
                    }, q.start()
                };
                "function" == typeof define && define.amd && define(function () {
                    return o
                }), b.exports = o, c.List = o
            }(window)
        }, {
            "./src/add-async": 2,
            "./src/filter": 3,
            "./src/item": 4,
            "./src/parse": 5,
            "./src/search": 6,
            "./src/sort": 7,
            "./src/templater": 8,
            "./src/utils/classes": 9,
            "./src/utils/events": 10,
            "./src/utils/extend": 11,
            "./src/utils/get-attribute": 12,
            "./src/utils/get-by-class": 13,
            "./src/utils/index-of": 14,
            "./src/utils/natural-sort": 15,
            "./src/utils/to-array": 16,
            "./src/utils/to-string": 17
        }], 2: [function (a, b, c) {
            b.exports = function (a) {
                var b = function (c, d, e) {
                    var f = c.splice(0, 50);
                    e = e || [], e = e.concat(a.add(f)), c.length > 0 ? setTimeout(function () {
                        b(c, d, e)
                    }, 1) : (a.update(), d(e))
                };
                return b
            }
        }, {}], 3: [function (a, b, c) {
            b.exports = function (a) {
                return a.handlers.filterStart = a.handlers.filterStart || [], a.handlers.filterComplete = a.handlers.filterComplete || [], function (b) {
                    if (a.trigger("filterStart"), a.i = 1, a.reset.filter(), void 0 === b)a.filtered = !1; else {
                        a.filtered = !0;
                        for (var c = a.items, d = 0, e = c.length; e > d; d++) {
                            var f = c[d];
                            b(f) ? f.filtered = !0 : f.filtered = !1
                        }
                    }
                    return a.update(), a.trigger("filterComplete"), a.visibleItems
                }
            }
        }, {}], 4: [function (a, b, c) {
            b.exports = function (a) {
                return function (b, c, d) {
                    var e = this;
                    this._values = {}, this.found = !1, this.filtered = !1;
                    var f = function (b, c, d) {
                        if (void 0 === c)d ? e.values(b, d) : e.values(b); else {
                            e.elm = c;
                            var f = a.templater.get(e, b);
                            e.values(f)
                        }
                    };
                    this.values = function (b, c) {
                        if (void 0 === b)return e._values;
                        for (var d in b)e._values[d] = b[d];
                        c !== !0 && a.templater.set(e, e.values())
                    }, this.show = function () {
                        a.templater.show(e)
                    }, this.hide = function () {
                        a.templater.hide(e)
                    }, this.matching = function () {
                        return a.filtered && a.searched && e.found && e.filtered || a.filtered && !a.searched && e.filtered || !a.filtered && a.searched && e.found || !a.filtered && !a.searched
                    }, this.visible = function () {
                        return e.elm && e.elm.parentNode == a.list ? !0 : !1
                    }, f(b, c, d)
                }
            }
        }, {}], 5: [function (a, b, c) {
            b.exports = function (b) {
                var c = a("./item")(b), d = function (a) {
                    for (var b = a.childNodes, c = [], d = 0, e = b.length; e > d; d++)void 0 === b[d].data && c.push(b[d]);
                    return c
                }, e = function (a, d) {
                    for (var e = 0, f = a.length; f > e; e++)b.items.push(new c(d, a[e]))
                }, f = function (a, c) {
                    var d = a.splice(0, 50);
                    e(d, c), a.length > 0 ? setTimeout(function () {
                        f(a, c)
                    }, 1) : (b.update(), b.trigger("parseComplete"))
                };
                return b.handlers.parseComplete = b.handlers.parseComplete || [], function () {
                    var a = d(b.list), c = b.valueNames;
                    b.indexAsync ? f(a, c) : e(a, c)
                }
            }
        }, {"./item": 4}], 6: [function (a, b, c) {
            b.exports = function (a) {
                var b, c, d, e, f = {
                    resetList: function () {
                        a.i = 1, a.templater.clear(), e = void 0
                    }, setOptions: function (a) {
                        2 == a.length && a[1]instanceof Array ? c = a[1] : 2 == a.length && "function" == typeof a[1] ? e = a[1] : 3 == a.length && (c = a[1], e = a[2])
                    }, setColumns: function () {
                        0 !== a.items.length && void 0 === c && (c = void 0 === a.searchColumns ? f.toArray(a.items[0].values()) : a.searchColumns)
                    }, setSearchString: function (b) {
                        b = a.utils.toString(b).toLowerCase(), b = b.replace(/[-[\]{}()*+?.,\\^$|#]/g, "\\$&"), d = b
                    }, toArray: function (a) {
                        var b = [];
                        for (var c in a)b.push(c);
                        return b
                    }
                }, g = {
                    list: function () {
                        for (var b = 0, c = a.items.length; c > b; b++)g.item(a.items[b])
                    }, item: function (a) {
                        a.found = !1;
                        for (var b = 0, d = c.length; d > b; b++)if (g.values(a.values(), c[b]))return void(a.found = !0)
                    }, values: function (c, e) {
                        return c.hasOwnProperty(e) && (b = a.utils.toString(c[e]).toLowerCase(), "" !== d && b.search(d) > -1) ? !0 : !1
                    }, reset: function () {
                        a.reset.search(), a.searched = !1
                    }
                }, h = function (b) {
                    return a.trigger("searchStart"), f.resetList(), f.setSearchString(b), f.setOptions(arguments), f.setColumns(), "" === d ? g.reset() : (a.searched = !0, e ? e(d, c) : g.list()), a.update(), a.trigger("searchComplete"), a.visibleItems
                };
                return a.handlers.searchStart = a.handlers.searchStart || [], a.handlers.searchComplete = a.handlers.searchComplete || [], a.utils.events.bind(a.utils.getByClass(a.listContainer, a.searchClass), "keyup", function (b) {
                    var c = b.target || b.srcElement, d = "" === c.value && !a.searched;
                    d || h(c.value)
                }), a.utils.events.bind(a.utils.getByClass(a.listContainer, a.searchClass), "input", function (a) {
                    var b = a.target || a.srcElement;
                    "" === b.value && h("")
                }), h
            }
        }, {}], 7: [function (a, b, c) {
            b.exports = function (a) {
                a.sortFunction = a.sortFunction || function (b, c, d) {
                    return d.desc = "desc" == d.order ? !0 : !1, a.utils.naturalSort(b.values()[d.valueName], c.values()[d.valueName], d)
                };
                var b = {
                    els: void 0, clear: function () {
                        for (var c = 0, d = b.els.length; d > c; c++)a.utils.classes(b.els[c]).remove("asc"), a.utils.classes(b.els[c]).remove("desc")
                    }, getOrder: function (b) {
                        var c = a.utils.getAttribute(b, "data-order");
                        return "asc" == c || "desc" == c ? c : a.utils.classes(b).has("desc") ? "asc" : a.utils.classes(b).has("asc") ? "desc" : "asc"
                    }, getInSensitive: function (b, c) {
                        var d = a.utils.getAttribute(b, "data-insensitive");
                        "false" === d ? c.insensitive = !1 : c.insensitive = !0
                    }, setOrder: function (c) {
                        for (var d = 0, e = b.els.length; e > d; d++) {
                            var f = b.els[d];
                            if (a.utils.getAttribute(f, "data-sort") === c.valueName) {
                                var g = a.utils.getAttribute(f, "data-order");
                                "asc" == g || "desc" == g ? g == c.order && a.utils.classes(f).add(c.order) : a.utils.classes(f).add(c.order)
                            }
                        }
                    }
                }, c = function () {
                    a.trigger("sortStart");
                    var c = {}, d = arguments[0].currentTarget || arguments[0].srcElement || void 0;
                    d ? (c.valueName = a.utils.getAttribute(d, "data-sort"), b.getInSensitive(d, c), c.order = b.getOrder(d)) : (c = arguments[1] || c, c.valueName = arguments[0], c.order = c.order || "asc", c.insensitive = "undefined" == typeof c.insensitive ? !0 : c.insensitive), b.clear(), b.setOrder(c), c.sortFunction = c.sortFunction || a.sortFunction, a.items.sort(function (a, b) {
                        var d = "desc" === c.order ? -1 : 1;
                        return c.sortFunction(a, b, c) * d
                    }), a.update(), a.trigger("sortComplete")
                };
                return a.handlers.sortStart = a.handlers.sortStart || [], a.handlers.sortComplete = a.handlers.sortComplete || [], b.els = a.utils.getByClass(a.listContainer, a.sortClass), a.utils.events.bind(b.els, "click", c), a.on("searchStart", b.clear), a.on("filterStart", b.clear), c
            }
        }, {}], 8: [function (a, b, c) {
            var d = function (a) {
                var b, c = this, d = function () {
                    b = c.getItemSource(a.item), b = c.clearSourceItem(b, a.valueNames)
                };
                this.clearSourceItem = function (b, c) {
                    for (var d = 0, e = c.length; e > d; d++) {
                        var f;
                        if (c[d].data)for (var g = 0, h = c[d].data.length; h > g; g++)b.setAttribute("data-" + c[d].data[g], ""); else c[d].attr && c[d].name ? (f = a.utils.getByClass(b, c[d].name, !0), f && f.setAttribute(c[d].attr, "")) : (f = a.utils.getByClass(b, c[d], !0), f && (f.innerHTML = ""));
                        f = void 0
                    }
                    return b
                }, this.getItemSource = function (b) {
                    if (void 0 === b) {
                        for (var c = a.list.childNodes, d = 0, e = c.length; e > d; d++)if (void 0 === c[d].data)return c[d].cloneNode(!0)
                    } else {
                        if (/^tr[\s>]/.exec(b)) {
                            var f = document.createElement("table");
                            return f.innerHTML = b, f.firstChild
                        }
                        if (-1 !== b.indexOf("<")) {
                            var g = document.createElement("div");
                            return g.innerHTML = b, g.firstChild
                        }
                        var h = document.getElementById(a.item);
                        if (h)return h
                    }
                    throw new Error("The list need to have at list one item on init otherwise you'll have to add a template.")
                }, this.get = function (b, d) {
                    c.create(b);
                    for (var e = {}, f = 0, g = d.length; g > f; f++) {
                        var h;
                        if (d[f].data)for (var i = 0, j = d[f].data.length; j > i; i++)e[d[f].data[i]] = a.utils.getAttribute(b.elm, "data-" + d[f].data[i]); else d[f].attr && d[f].name ? (h = a.utils.getByClass(b.elm, d[f].name, !0), e[d[f].name] = h ? a.utils.getAttribute(h, d[f].attr) : "") : (h = a.utils.getByClass(b.elm, d[f], !0), e[d[f]] = h ? h.innerHTML : "");
                        h = void 0
                    }
                    return e
                }, this.set = function (b, d) {
                    var e = function (b) {
                        for (var c = 0, d = a.valueNames.length; d > c; c++)if (a.valueNames[c].data) {
                            for (var e = a.valueNames[c].data, f = 0, g = e.length; g > f; f++)if (e[f] === b)return {data: b}
                        } else {
                            if (a.valueNames[c].attr && a.valueNames[c].name && a.valueNames[c].name == b)return a.valueNames[c];
                            if (a.valueNames[c] === b)return b
                        }
                    }, f = function (c, d) {
                        var f, g = e(c);
                        g && (g.data ? b.elm.setAttribute("data-" + g.data, d) : g.attr && g.name ? (f = a.utils.getByClass(b.elm, g.name, !0), f && f.setAttribute(g.attr, d)) : (f = a.utils.getByClass(b.elm, g, !0), f && (f.innerHTML = d)), f = void 0)
                    };
                    if (!c.create(b))for (var g in d)d.hasOwnProperty(g) && f(g, d[g])
                }, this.create = function (a) {
                    if (void 0 !== a.elm)return !1;
                    var d = b.cloneNode(!0);
                    return d.removeAttribute("id"), a.elm = d, c.set(a, a.values()), !0
                }, this.remove = function (b) {
                    b.elm.parentNode === a.list && a.list.removeChild(b.elm)
                }, this.show = function (b) {
                    c.create(b), a.list.appendChild(b.elm)
                }, this.hide = function (b) {
                    void 0 !== b.elm && b.elm.parentNode === a.list && a.list.removeChild(b.elm)
                }, this.clear = function () {
                    if (a.list.hasChildNodes())for (; a.list.childNodes.length >= 1;)a.list.removeChild(a.list.firstChild)
                }, d()
            };
            b.exports = function (a) {
                return new d(a)
            }
        }, {}], 9: [function (a, b, c) {
            function d(a) {
                if (!a || !a.nodeType)throw new Error("A DOM element reference is required");
                this.el = a, this.list = a.classList
            }

            var e = a("./index-of"), f = /\s+/, g = Object.prototype.toString;
            b.exports = function (a) {
                return new d(a)
            }, d.prototype.add = function (a) {
                if (this.list)return this.list.add(a), this;
                var b = this.array(), c = e(b, a);
                return ~c || b.push(a), this.el.className = b.join(" "), this
            }, d.prototype.remove = function (a) {
                if ("[object RegExp]" == g.call(a))return this.removeMatching(a);
                if (this.list)return this.list.remove(a), this;
                var b = this.array(), c = e(b, a);
                return ~c && b.splice(c, 1), this.el.className = b.join(" "), this
            }, d.prototype.removeMatching = function (a) {
                for (var b = this.array(), c = 0; c < b.length; c++)a.test(b[c]) && this.remove(b[c]);
                return this
            }, d.prototype.toggle = function (a, b) {
                return this.list ? ("undefined" != typeof b ? b !== this.list.toggle(a, b) && this.list.toggle(a) : this.list.toggle(a), this) : ("undefined" != typeof b ? b ? this.add(a) : this.remove(a) : this.has(a) ? this.remove(a) : this.add(a), this)
            }, d.prototype.array = function () {
                var a = this.el.getAttribute("class") || "", b = a.replace(/^\s+|\s+$/g, ""), c = b.split(f);
                return "" === c[0] && c.shift(), c
            }, d.prototype.has = d.prototype.contains = function (a) {
                return this.list ? this.list.contains(a) : !!~e(this.array(), a)
            }
        }, {"./index-of": 14}], 10: [function (a, b, c) {
            var d = window.addEventListener ? "addEventListener" : "attachEvent", e = window.removeEventListener ? "removeEventListener" : "detachEvent", f = "addEventListener" !== d ? "on" : "", g = a("./to-array");
            c.bind = function (a, b, c, e) {
                a = g(a);
                for (var h = 0; h < a.length; h++)a[h][d](f + b, c, e || !1)
            }, c.unbind = function (a, b, c, d) {
                a = g(a);
                for (var h = 0; h < a.length; h++)a[h][e](f + b, c, d || !1)
            }
        }, {"./to-array": 16}], 11: [function (a, b, c) {
            b.exports = function (a) {
                for (var b, c = Array.prototype.slice.call(arguments, 1), d = 0; b = c[d]; d++)if (b)for (var e in b)a[e] = b[e];
                return a
            }
        }, {}], 12: [function (a, b, c) {
            b.exports = function (a, b) {
                var c = a.getAttribute && a.getAttribute(b) || null;
                if (!c)for (var d = a.attributes, e = d.length, f = 0; e > f; f++)void 0 !== b[f] && b[f].nodeName === b && (c = b[f].nodeValue);
                return c
            }
        }, {}], 13: [function (a, b, c) {
            b.exports = function () {
                return document.getElementsByClassName ? function (a, b, c) {
                    return c ? a.getElementsByClassName(b)[0] : a.getElementsByClassName(b)
                } : document.querySelector ? function (a, b, c) {
                    return b = "." + b, c ? a.querySelector(b) : a.querySelectorAll(b)
                } : function (a, b, c) {
                    var d = [], e = "*";
                    null === a && (a = document);
                    for (var f = a.getElementsByTagName(e), g = f.length, h = new RegExp("(^|\\s)" + b + "(\\s|$)"), i = 0, j = 0; g > i; i++)if (h.test(f[i].className)) {
                        if (c)return f[i];
                        d[j] = f[i], j++
                    }
                    return d
                }
            }()
        }, {}], 14: [function (a, b, c) {
            var d = [].indexOf;
            b.exports = function (a, b) {
                if (d)return a.indexOf(b);
                for (var c = 0; c < a.length; ++c)if (a[c] === b)return c;
                return -1
            }
        }, {}], 15: [function (a, b, c) {
            b.exports = function (a, b, c) {
                var d, e, f = /(^([+\-]?(?:\d*)(?:\.\d*)?(?:[eE][+\-]?\d+)?)?$|^0x[\da-fA-F]+$|\d+)/g, g = /^\s+|\s+$/g, h = /\s+/g, i = /(^([\w ]+,?[\w ]+)?[\w ]+,?[\w ]+\d+:\d+(:\d+)?[\w ]?|^\d{1,4}[\/\-]\d{1,4}[\/\-]\d{1,4}|^\w+, \w+ \d+, \d{4})/, j = /^0x[0-9a-f]+$/i, k = /^0/, l = c || {}, m = function (a) {
                    return l.insensitive && ("" + a).toLowerCase() || "" + a
                }, n = m(a) || "", o = m(b) || "", p = n.replace(f, "\x00$1\x00").replace(/\0$/, "").replace(/^\0/, "").split("\x00"), q = o.replace(f, "\x00$1\x00").replace(/\0$/, "").replace(/^\0/, "").split("\x00"), r = parseInt(n.match(j), 16) || 1 !== p.length && Date.parse(n), s = parseInt(o.match(j), 16) || r && o.match(i) && Date.parse(o) || null, t = function (a, b) {
                    return (!a.match(k) || 1 == b) && parseFloat(a) || a.replace(h, " ").replace(g, "") || 0
                };
                if (s) {
                    if (s > r)return -1;
                    if (r > s)return 1
                }
                for (var u = 0, v = p.length, w = q.length, x = Math.max(v, w); x > u; u++) {
                    if (d = t(p[u], v), e = t(q[u], w), isNaN(d) !== isNaN(e))return isNaN(d) ? 1 : -1;
                    if (typeof d != typeof e && (d += "", e += ""), e > d)return -1;
                    if (d > e)return 1
                }
                return 0
            }
        }, {}], 16: [function (a, b, c) {
            function d(a) {
                return "[object Array]" === Object.prototype.toString.call(a)
            }

            b.exports = function (a) {
                if ("undefined" == typeof a)return [];
                if (null === a)return [null];
                if (a === window)return [window];
                if ("string" == typeof a)return [a];
                if (d(a))return a;
                if ("number" != typeof a.length)return [a];
                if ("function" == typeof a && a instanceof Function)return [a];
                for (var b = [], c = 0; c < a.length; c++)(Object.prototype.hasOwnProperty.call(a, c) || c in a) && b.push(a[c]);
                return b.length ? b : []
            }
        }, {}], 17: [function (a, b, c) {
            b.exports = function (a) {
                return a = void 0 === a ? "" : a, a = null === a ? "" : a, a = a.toString()
            }
        }, {}]
    }, {}, [1]);
</script>

<script type="text/javascript">
    var brandOptions = {
        valueNames: ['brand-name', 'founded-year', 'headquarter']
    };

    var brandList = new List('car-brands', brandOptions);

    var modelOptions = {
        valueNames: ['brand-name', 'model-name', 'generation', 'production-year',
            'doors', 'seats','maximum-speed']
    };

    var modelList = new List('car-models', modelOptions);
</script>



</body>
</html>
