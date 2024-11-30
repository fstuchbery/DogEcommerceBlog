# Use the official Ruby image as the base image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  sqlite3 \
  libsqlite3-dev \
  && apt-get clean

# Set up the working directory
WORKDIR /app

# Install the required gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the app's code
COPY . ./



# Expose port 3000 (or whichever port you want to run the app on)
EXPOSE 3000

# Run the Rails server
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
