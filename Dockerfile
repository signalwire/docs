FROM fernenterprise/fern-self-hosted:0.112.5

# Copy project files
COPY package.json yarn.lock ./
COPY fern/ /fern/
COPY specs/ /specs/

# Install yarn and dependencies
RUN npm install -g yarn
RUN yarn install --frozen-lockfile

# Build all TypeSpec specs → OpenAPI YAML + SWML JSON Schema (outputs into /fern/apis/*)
RUN yarn build:specs

# Generate docs
RUN fern-generate
