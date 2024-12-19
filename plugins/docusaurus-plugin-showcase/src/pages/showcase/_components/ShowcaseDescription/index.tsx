import React from 'react';
import MDXContent from "@theme/MDXContent";
import DescriptionContent from "../../../../data/description.mdx"


// Component to render MDX content
const DescriptionComponent = () => {

  // Render the MDX content
  return (
    <div className="description">
      <MDXContent>
        <DescriptionContent />
      </MDXContent>
    </div>
  );
};

export default DescriptionComponent;