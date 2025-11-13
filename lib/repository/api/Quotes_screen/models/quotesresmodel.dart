// To parse this JSON data, do
//
//     final quotesResModel = quotesResModelFromJson(jsonString);

import 'dart:convert';

QuotesResModel quotesResModelFromJson(String str) => QuotesResModel.fromJson(json.decode(str));

String quotesResModelToJson(QuotesResModel data) => json.encode(data.toJson());

class QuotesResModel {
    List<Quote>? quotes;
    int? total;
    int? skip;
    int? limit;

    QuotesResModel({
        this.quotes,
        this.total,
        this.skip,
        this.limit,
    });

    factory QuotesResModel.fromJson(Map<String, dynamic> json) => QuotesResModel(
        quotes: json["quotes"] == null ? [] : List<Quote>.from(json["quotes"]!.map((x) => Quote.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "quotes": quotes == null ? [] : List<dynamic>.from(quotes!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Quote {
    int? id;
    String? quote;
    String? author;

    Quote({
        this.id,
        this.quote,
        this.author,
    });

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json["id"],
        quote: json["quote"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quote": quote,
        "author": author,
    };
}
