import { translate } from "@docusaurus/Translate";
import getPluginConfig from "../utils/getPluginConfig";

export type Tag = {
    name: string;
    label: string;
    description: string;
    color: string;
    reference?: string;
    link?: string;
    header?: boolean;
    subHeaderIDs?: string[];
    category?: string;
  };

let pluginConfig = getPluginConfig();

let tags: Tag[] = processTags(pluginConfig.tags);

export const TagList = tags;

function processTags(tags: Tag[]) {
    if (!tags) { 
        return [];
    }
        
    let newTags = [];
    for (const tag of tags) {
        newTags.push({
            name: tag.name ? tag.name : "",
            label: translate({ message: tag.label ? tag.label : "" }),
            description: translate({
                message: tag.description ? tag.description : "",
                id: "showcase.tag." + tag.name ? tag.name : "" + ".description",
            }),
            color: tag.color ? tag.color : "",
            reference: tag.reference ? tag.reference : "",
            link: tag.link ? tag.link : "",
            header: tag.header ? tag.header : false,
            category: (tag.category !== undefined) ? tag.category : "Filters",
            subHeaders: tag.subHeaderIDs ? tag.subHeaderIDs : []
        })
    }

    return newTags;
}