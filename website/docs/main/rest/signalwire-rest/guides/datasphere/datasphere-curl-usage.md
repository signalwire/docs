---
title: Use the Datasphere API with curl - A step-by-step guide
description: Interact with the Datasphere API with curl. Use different chunking strategies such as `page`, `sentence`, `paragraph`, and `sliding`, and filter results with powerful query options.
sidebar_label: Essential operations with curl
slug: /rest/signalwire-rest/guides/datasphere/curl-usage
---

# Use the Datasphere API with `curl`

SignalWire's new Datasphere API is a custom-built Retrieval-Augmented Generation (RAG) stack
empowering developers to upload, manipulate, and retrieve information in the context of a SignalWire application.
This guide is a tutorial and reference for using `curl` to interact with the Datasphere API, covering the following essential topics:

- **[Vectorization:](#vectorize-documents)** Parameters and best practices for optimal "chunking", or splitting text into usable units which are then vectorized and filed in a database.
- **[Search:](#search)** Customizing search queries to finely filter results from vectorized documents, and using `jq` to parse the API responses for better readability.
- **[Management:](#manage-documents)** Listing and deleting documents.

## Prerequisites

To use this guide, you'll need the following prerequisites:

- A SignalWire account and Space
- One or more PDF text documents on a server, or otherwise accessible to the API by URL
- The [jq](https://jqlang.github.io/jq/) command-line tool is strongly recommended for readable JSON responses.
Install with `brew install jq` on MacOS, `winget install jqlang.jq` on Windows, or by following the [installation instructions](https://jqlang.github.io/jq/download/).

In the following examples:

- `<project_id>` is a placeholder for your actual Project ID.
- `<token>` is a placeholder for your authentication token.
- `<space_name>` is a placeholder for your Space name.

Replace these placeholders with your actual details.

---

## Vectorize documents

The first step in working with information in Datasphere is to upload (or "vectorize") a document.
To do so, specify a chunking strategy, and chunk parameters as needed.
The following examples show how to use the available chunking strategies with `curl` requests.

:::tip Readable JSON

Each example below uses the **jq** command-line tool to format the JSON response.
This makes it easier to extract important details like `document_id`.
Refer to this guide's [Prerequisites](#prerequisites) for details and installation instructions.

:::

### Sentence chunking

The Sentence chunking strategy splits the document into sentence-sized pieces.

| Parameter                 | Default | Type    | Description                            |
|:--------------------------|:--------|---------|----------------------------------------|
| `max_sentences_per_chunk` | `1`     | Number  | Maximum number of sentences per chunk. |
| `split_newlines`          | `false` | Boolean | Whether to split chunks on new lines.  |

The following example uses `sentence` chunking to split a document into individual sentences.
Setting `max_sentences_per_chunk` to `3` restricts each chunk to a maximum of 3 sentences,
while setting `split_newlines` to `true` causes chunks to split at new lines.

```bash
curl -L -X POST https://<space_name>.signalwire.com/api/datasphere/documents \
-H 'Content-Type: application/json' \
-H 'Accept: application/json' \
-u <project_id>:<token> \
-d '{
  "url": "https://mcdn.signalwire.com/drinks.pdf",
  "chunking_strategy": "sentence",
  "max_sentences_per_chunk": 3,         # Cap chunks at three sentences
  "split_newlines": true,                  # Split chunks on new lines
  "tags": [
    "Drinks",
    "Bar",
    "Night"
  ]
}' | jq '.'
```

### Sliding chunking

This chunking strategy splits a document into overlapping sections of a specified word length.

| Parameter      | Default | Type   | Description                                           |
|:---------------|:--------|--------|-------------------------------------------------------|
| `chunk_size`   | `50`    | Number | Number of words per chunk.                            |
| `overlap_size` | `10`    | Number | Amount of overlap between chunks, in number of words. |

The size of each chunk is set using `chunk_size` in words - in this case, 50.
`overlap_size` sets the number of words to overlap between chunks.
An overlap of `10` means that the last `10` words in one chunk will repeat at the start of the next.

```bash
curl -L -X POST https://<space_name>.signalwire.com/api/datasphere/documents \
-H 'Content-Type: application/json' \
-H 'Accept: application/json' \
-u <project_id>:<token> \
-d '{
  "url": "https://mcdn.signalwire.com/drinks.pdf",
  "chunking_strategy": "sliding",
  "chunk_size": 50,                     # Set chunk size to 50 words
  "overlap_size": 10,                   # Chunks will overlap by 10 words
  "tags": [
    "Drinks",
    "Bar",
    "Night"
  ]
}' | jq '.'
```

### Paragraph and page chunking

This example uses the `paragraph` chunking strategy to split a document into chunks by paragraph.
Note that no chunk parameters are needed for `paragraph` and `page` chunking strategies.

```bash
curl -L -X POST https://<space_name>.signalwire.com/api/datasphere/documents \
-H 'Content-Type: application/json' \
-H 'Accept: application/json' \
-u <project_id>:<token> \
-d '{
  "url": "https://mcdn.signalwire.com/drinks.pdf",
  "chunking_strategy": "paragraph",      # No chunk parameters required for paragraph or page
  "tags": [
    "Drinks",
    "Bar",
    "Night"
  ]
}' | jq '.'
```

:::important Can I see your ID

After vectorizing a document with a command like the above examples, make note of the `document_id` field returned in the JSON response. 
You will use this ID in the subsequent commands to reference this specific document.

:::

---

## Search

Use customizable queries to perform searches within a document vectorized in Datasphere.
The options described in this section allow you to filter results by tags, set proximity distances for better relevance, limit result counts, and adjust language settings.

Here are the available search options:

1. **`document_id` (optional)**:  
   The `document_id` is the ID of the specific document you want to search within. If left blank, the search can be performed across all documents.  
   **Example**: `"document_id": "ea6faa03-dd09-4cca-a5be-61d535ec4c1e"`

2. **`query_string` (required)**:  
   This is the search query string that you want to search for in the document. It is a required field.  
   **Example**: `"query_string": "How do I make a screwdriver?"`

3. **`tags` (optional)**:  
   You can specify tags to limit the search to documents that are associated with these tags. The tags should be an array of strings.  
   **Example**: `"tags": ["Drinks", "Bar"]`

4. **`distance` (optional)**:  
   This option specifies how "distant" the search results can be from your query in terms of similarity or relevance. The value must be between `0.0` and `78.3836717690617`, where a lower value is more restrictive, and a higher value allows more flexible matching.  
   **Example**: `"distance": 15.0"`

5. **`count` (optional)**:  
   The maximum number of search results you want to return. This should be an integer greater than 0.  
   **Example**: `"count": 3"`

6. **`language` (optional, default: `"en"`)**:  
   This specifies the language of the document content you're searching in. The default is `"en"` (English).  
   **Example**: `"language": "en"`

7. **`pos_to_expand` (optional, default: `%w[NOUN VERB ADJ ADV]`)**:  
   This specifies which parts of speech (POS) should be expanded when searching for synonyms. The default values are `NOUN`, `VERB`, `ADJ`, and `ADV`, which correspond to nouns, verbs, adjectives, and adverbs.  
   **Example**: `"pos_to_expand": ["NOUN", "VERB"]`

8. **`max_synonyms` (optional, default: `10`)**:  
   This option sets the maximum number of synonyms that should be considered during the search. The default is 10.  
   **Example**: `"max_synonyms": 5"`

### Custom search query example

The following sample query uses all available search options to filter returned items.

- **`document_id`**: The document where the search will be conducted. Replace `<your-document-id>` with the actual `document_id`.
- **`query_string`**: The search query for "How do I make a screwdriver?"
- **`tags`**: Only documents tagged with "Drinks" and "Bar" will be searched.
- **`distance`**: A distance of 15.0 will allow moderate flexibility in matching search results.
- **`count`**: The search will return a maximum of 3 results.
- **`language`**: The search is limited to documents in English (`"en"`).
- **`pos_to_expand`**: Synonym expansion will only happen for nouns and verbs.
- **`max_synonyms`**: A maximum of 5 synonyms will be used for each word in the query.

Here’s how to use these options in your `curl` command to perform a search:

```bash
curl -L -X POST https://<space_name>.signalwire.com/api/datasphere/documents/search \
-u <project_id>:<token> \
-H 'Content-Type: application/json' \
-H 'Accept: application/json' \
--data '{
  "document_id": "<your-document-id>",
  "query_string": "How do I make a screw driver?",
  "tags": ["Drinks", "Bar"],
  "distance": 15.0,
  "count": 3,
  "language": "en",
  "pos_to_expand": ["NOUN", "VERB"],
  "max_synonyms": 5
}'
```

---

## Manage documents

Review and delete uploaded documents using the following commands.

### List

Retrieve a list of all documents uploaded to Datasphere using this command.
This can help track your documents and find their `document_id`.

```bash
curl -L -X GET https://<space_name>.signalwire.com

/api/datasphere/documents \
-H 'Accept: application/json' \
-u <project_id>:<token> | jq '.'
```

### Delete

If you no longer need a document in Datasphere, you can delete it using its `document_id`.

:::caution

This request permanently removes the document linked to the specified `document_id` from Datasphere.

:::

```bash
curl -L -X DELETE https://<space_name>.signalwire.com/api/datasphere/documents/<your-document-id> \
-H 'Accept: application/json' \
-u <project_id>:<token>
```

---

## Summary

1. **Upload a Document:** Use the `POST` method to upload and vectorize a document, selecting a chunking strategy (page, sentence, paragraph, or sliding) and specifying chunk parameters as needed.
2. **Search a Document:** Use the `document_id` to search specific documents with a query string and use additional search options such as tags, distance, and part-of-speech expansion.
3. **List Documents:** Retrieve a list of all uploaded documents and find their `document_id` or other metadata.
4. **Delete a Document:** Remove a document using its `document_id` if it’s no longer needed.

These steps allow you to interact with the Datasphere API effectively, utilizing flexible chunking strategies for document processing and advanced search options for relevance. 
Using `jq` helps you parse the JSON responses and easily retrieve important information. 
Make sure to replace placeholders like `<project_id>`, `<token>`, `<space_name>`, and `<document_id>` with actual values when running the commands.