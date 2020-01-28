#
# This file is part of Astarte.
#
# Copyright 2020 Ispirata Srl
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

defmodule Astarte.RealmManagement.API.Health do
  @moduledoc """
  Performs health checks of the RealmManagement service
  """

  alias Astarte.RealmManagement.API.Health.BackendHealth
  alias Astarte.RealmManagement.API.RPC.RealmManagement

  @doc """
  Gets the backend health. Returns `{:ok, %BackendHealth{}`
  """
  def get_backend_health do
    with {:ok, %{status: status}} <- RealmManagement.get_health() do
      {:ok, %BackendHealth{status: status}}
    else
      _ ->
        {:ok, %BackendHealth{status: :error}}
    end
  end
end
